#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(int argc, char** argv)
{
	if (argc != 2)
	{
		printf("\033[0;31mUsage:\033[0m ./defClass name_class\n");
		return 1;
	}

	char *class_name = argv[1];
	int len = strlen(class_name) + 5;
	
	char *file_name = (char *)malloc(len);
	if (!file_name)
	{
		printf("\033[0;31m[-]\033[0m Error: Memory allocation failed!\n");
		return 1;
	}

	strcpy(file_name, class_name);
	strcat(file_name, ".hpp");

	if (access(file_name, F_OK) == 0)
	{
		printf("\033[0;31mError:\033[0m File '%s' already exists!\n", file_name);
		free(file_name);
		return 1;
	}


	char *unic_name = (char *)malloc(len);
	if (!unic_name)
	{
		free(file_name);
		printf("\033[0;31m[-]\033[0m Error: Memory allocation failed!\n");
		return 1;
	}

	for(int i = 0; i < len - 1; ++i)
	{
		if (file_name[i] == '.')
			unic_name[i] = '_';
		else
			unic_name[i] = toupper(file_name[i]);
	}
	unic_name[len - 1] = '\0';

	FILE *my_file = fopen(file_name, "w");
	if (my_file != NULL)
	{
		fprintf(my_file, "#ifndef %s\n", unic_name);
		fprintf(my_file, "# define %s\n\n", unic_name);
		fprintf(my_file, "class %s\n{\n", class_name);
		/*****	 BODY START   *****/
		fprintf(my_file, "\t// Write your code here!\n");
		fprintf(my_file, "\tpublic:\n");
		fprintf(my_file, "\t\t%s();\n", class_name);
		fprintf(my_file, "\t\t%s(const %s& other);\n", class_name, class_name);
		fprintf(my_file, "\t\t%s& operator=(const %s& other);\n", class_name, class_name);
		fprintf(my_file, "\t\t~%s();\n", class_name);
		/*****	 BODY END	*****/
		fprintf(my_file, "};\n\n");
		fprintf(my_file, "#endif /* %s */\n", unic_name);

		fclose(my_file);
		printf("\033[0;32m[+] Created file:\033[0m %s\n", file_name);
		printf("\033[0;32m[+] Class name:\033[0m   %s\n", class_name);
	}
	else
	{
			printf("\033[0;31m[-] Error:\033[0m Not created file and class!\n");
			return 1;
	}

	free(file_name);
	free(unic_name);

	return 0;
}
