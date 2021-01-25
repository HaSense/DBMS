#include<stdio.h>
/* mysql.h error --> apt install libmysqlclient-dev */
#include "/usr/include/mysql/mysql.h"
/* mysql.h location --> mysql_config --cflags*/
/* compile option --> gcc -o [App] [src.c] -lmysqlclient */

int main()
{

    MYSQL mysql;
    mysql_init(&mysql);

    if(!mysql_real_connect(&mysql, "localhost", "root", "iot123", "sys", 3306, NULL, 0)){
        printf("error\n");
    }else{
        printf("success \n");
    }

    mysql_close(&mysql);

    printf("Hello mysql~! \n");
    return 0;
    
}
