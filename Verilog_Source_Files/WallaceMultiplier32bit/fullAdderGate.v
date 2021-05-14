module fullAdder (a, b, cin, sum, ca);
input a, b, cin;
output sum, ca;

wire w1, w2, w3, w4, w5;

xor xor_0 (w1, a, b);
xor xor_1 (sum, w1, cin);

and and_0 (w2, a, b);
and and_1 (w3, a, cin);
and and_2 (w4, b, cin);
or  or_0 (w5, w2, w3);
or  or_1 (ca, w4, w5);

endmodule
