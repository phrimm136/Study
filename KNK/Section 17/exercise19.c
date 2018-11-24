#include <stdio.h>
#include <string.h>

void command(void (*f)(void));
void new_cmd(void);
void open_cmd(void);
void close_cmd(void);
void close_all_cmd(void);
void save_cmd(void);
void save_as_cmd(void);
void save_all_cmd(void);
void print_cmd(void);
void exit_cmd(void);

struct
{
	char *cmd_name;
	void (*cmd_pointer)(void);
} file_cmd[] = {{"new", 	   new_cmd},
				{"open", 	   open_cmd},
				{"close", 	   close_cmd},
				{"close all", close_all_cmd},
				{"save", 	   save_cmd},
				{"save as",   save_as_cmd},
				{"save all",  save_all_cmd},
				{"print",	   print_cmd},
				{"exit",	   exit_cmd}};

int main(void)
{
	char cmd[20];
	
	printf("Enter command: ");
	scanf("%s", cmd);
	
	for (int i = 0; i < 9; i++)
	{
		if (strcmp(cmd, file_cmd[i].cmd_name) == 0)
			command(file_cmd[i].cmd_pointer);
	}
	
	return 0;
}

void command(void (*f)(void))
{
	(*f)();
}

void new_cmd(void)
{
	printf("new");
}

void open_cmd(void)
{
	printf("open");
}

void close_cmd(void)
{
	printf("close");
}

void close_all_cmd(void)
{
	printf("close all");
}

void save_cmd(void)
{
	printf("save");
}

void save_as_cmd(void)
{
	printf("save as");
}

void save_all_cmd(void)
{
	printf("save all");
}

void print_cmd(void)
{
	printf("print");
}

void exit_cmd(void)
{
	printf("exit");
}