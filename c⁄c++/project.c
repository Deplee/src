#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <pwd.h>
#include <string.h>


#define notexists 0
#define exists 33

/* variables */
char *home;

char *dirs[] = {
	NULL,
	"/bash_practice",
	NULL,
	NULL
};

/* get user home function */
char get_home_dir(){



	if ((home = getenv("HOME")) == NULL) {
		char *home = (char *)malloc(sizeof(*home));
		if (NULL == home) { 
			printf("OS didn't gave memory\n"); 
			exit(1);
		} else {
			home = getpwuid(getuid())->pw_dir;
		}
	}
	
}

/* check dir exists or not exists function */
int isExists(char *path){

	int a;
    DIR *dir;
    dir = opendir(path);
    if (dir == NULL) {
        /* not exits */
        a = 0;
        return a; 
        closedir(dir);
    } 
	else {
        /* exists */
        a = 1;
        closedir(dir);  ;
        return a;
	}
}

/* make dirs */
void make_dirs(){

	get_home_dir();
	
	*dirs = malloc(sizeof(*dirs));
	char *rootdir = strcat(home,dirs[1]);
	
	/* if /bash_practice exists */
	if (isExists(home) == 1) {
		printf("\t\t-----> Error info <-----\n\t-----> Directory already exists <-----\n\t-----> Main Dir: %s <-----\n\t-----> Programm ended with status %d <-----\n",rootdir,exists);
		*dirs = NULL;
		exit(exists);
	}
	/* if /bash_practice not exists */
	else if (isExists(home) == 0) {
		printf("\t\t-----> Install info <-----\n\t-----> Dir %s created <-----\n\t-----> Path to Dir: %s <-----\n\t-----> Programm ended with status %d <-----\n",dirs[1],rootdir,notexists);
		mkdir(home,0755);
		*dirs = NULL;
	}
	

	
}


int main(){

	/*int N;
	printf("Enter size of array: ");
	scanf("%d",&N);
	char *A = (char *)malloc(N);
	if (NULL == A) { printf("OS didn't gave memory\n"); exit(1); }
	for (int i = 0; i < N; i++)
		A[i] = i;
	printf("Array created\n"); */
	make_dirs();
	//printf("%s\n",dirs[1]);
	return 0;
}


