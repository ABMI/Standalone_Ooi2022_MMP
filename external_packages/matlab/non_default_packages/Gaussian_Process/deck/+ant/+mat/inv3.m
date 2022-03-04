function [I,d] = inv3(M)
% The inverse of a 3x3 matrix:
% 
% | a11 a12 a13 |-1             |   a33a22-a32a23  -(a33a12-a32a13)   a23a12-a22a13  |
% | a21 a22 a23 |    =  1/DET * | -(a33a21-a31a23)   a33a11-a31a13  -(a23a11-a21a13) |
% | a31 a32 a33 |               |   a32a21-a31a22  -(a32a11-a31a12)   a22a11-a21a12  |
% 
% with DET  =  a11(a33a22-a32a23)-a21(a33a12-a32a13)+a31(a23a12-a22a13)

    assert( ismatrix(M) && all(size(M) == 3), 'M must be a 3x3 matrix.' );
    
    d =     M(1,1)*(M(3,3)*M(2,2)-M(3,2)*M(2,3));
    d = d - M(2,1)*(M(3,3)*M(1,2)-M(3,2)*M(1,3));
    d = d + M(3,1)*(M(2,3)*M(1,2)-M(2,2)*M(1,3));
    
    assert( abs(d) > eps, 'M is not inversible.' );
    
    I = [   M(3,3)*M(2,2)-M(3,2)*M(2,3)  -(M(3,3)*M(1,2)-M(3,2)*M(1,3))   M(2,3)*M(1,2)-M(2,2)*M(1,3)  ;
          -(M(3,3)*M(2,1)-M(3,1)*M(2,3))   M(3,3)*M(1,1)-M(3,1)*M(1,3)  -(M(2,3)*M(1,1)-M(2,1)*M(1,3)) ;
            M(3,2)*M(2,1)-M(3,1)*M(2,2)  -(M(3,2)*M(1,1)-M(3,1)*M(1,2))   M(2,2)*M(1,1)-M(2,1)*M(1,2)  ] / d;
    
end