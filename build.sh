rm *.o
rm testAverage
as -g -o testAverage.o testAverage.s
gcc -o testAverage testAverage.o
