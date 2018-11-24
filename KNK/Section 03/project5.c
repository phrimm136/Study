#include <stdio.h>

int main()
{
	int f_f, f_s, f_t, f_fo, s_f, s_s, s_t, s_fo, t_f, t_s, t_t, t_fo, fo_f, fo_s, fo_t, fo_fo;
	
	printf("Enter the numbers from 1 to 16 in any order:\n");
	scanf("%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d",
	&f_f, &f_s, &f_t, &f_fo, &s_f, &s_s, &s_t, &s_fo, &t_f, &t_s, &t_t, &t_fo, &fo_f, &fo_s, &fo_t, &fo_fo);
	
	printf("%2d %2d %2d %2d\n%2d %2d %2d %2d\n%2d %2d %2d %2d\n%2d %2d %2d %2d\n",
	f_f, f_s, f_t, f_fo, s_f, s_s, s_t, s_fo, t_f, t_s, t_t, t_fo, fo_f, fo_s, fo_t, fo_fo);
	printf("Row sums: %d %d %d %d\n",
	f_f + f_s + f_t + f_fo, s_f + s_s + s_t + s_fo, t_f + t_s + t_t + t_fo, fo_f + fo_s + fo_t + fo_fo);
	printf("column sums: %d %d %d %d\n",
	f_f + s_f + t_f + fo_f, f_s + s_s + t_s + fo_s, f_t + s_t + t_t + fo_t, f_fo + s_fo + t_fo + fo_fo);
	printf("Diagonal sums: %d %d\n", f_f + s_s + t_t + fo_fo, f_fo + s_t + t_s + fo_f);
	
	return 0;
}