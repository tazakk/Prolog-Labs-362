median(A,B,C,X) :- X=A, B>=A, A>=C.
median(A,B,C,X) :- X=A, C>=A, A>=B.
median(A,B,C,X) :- X=B, A>=B, B>=C.
median(A,B,C,X) :- X=B, C>=B, B>=A.
median(A,B,C,X) :- X=C, A>=C, C>=B.
median(A,B,C,X) :- X=C, B>=C, C>=A.
