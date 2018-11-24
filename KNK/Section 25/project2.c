#include <stdio.h>
#include <locale.h>

int main(void)
{
	struct lconv *loconv;
	
	setlocale(LC_ALL, "");
	loconv = localeconv();
	
	printf("decimal_point = \"%s\"\n", loconv->decimal_point);
	printf("Thousands_sep = \"%s\"\n", loconv->thousands_sep);
	printf("grouping = %s\n", loconv->grouping);
	printf("mon_decimal_point = \"%s\"\n", loconv->mon_decimal_point);
	printf("mon_thousands_sep = \"%s\"\n", loconv->mon_thousands_sep);
	printf("mon_grouping = %s\n", loconv->grouping);
	printf("positive_sign = \"%s\"\n", loconv->positive_sign);
	printf("negative_sign = \"%s\"\n", loconv->negative_sign);
	printf("currency_symbol = \"%s\"\n", loconv->currency_symbol);
	printf("frac_digits = %d\n", loconv->frac_digits);
	printf("p_cs_precedes = %d\n", loconv->p_cs_precedes);
	printf("n_cs_precedes = %d\n", loconv->n_cs_precedes);
	printf("p_sep_by_space = %d\n", loconv->p_sep_by_space);
	printf("n_sep_by_space = %d\n", loconv->n_sep_by_space);
	printf("p_sign_posn = %d\n", loconv->p_sign_posn);
	printf("n_sign_posn = %d\n", loconv->n_sign_posn);
	printf("int_curr_symbol = \"%s\"\n", loconv->int_curr_symbol);
	printf("int_frac_digits = %d\n", loconv->int_frac_digits);
	/*printf("int_p_cs_precedes = \"%d\"\n", loconv->int_p_cs_precedes);
	printf("int_n_cs_precedes = \"%d\"\n", loconv->int_n_cs_precedes);
	printf("int_p_sep_by_space = \"%d\"\n", loconv->int_p_sep_by_space);
	printf("int_n_sep_by_space = \"%d\"\n", loconv->int_n_sep_by_space);
	printf("int_p_sign_posn = \"%d\"\n", loconv->int_p_sign_posn);
	printf("int_n_sign_posn = \"%d\"\n", loconv->int_n_sign_posn);*/
	
	return 0;
}