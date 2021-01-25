#include<stdio.h>
#include <mysql.h>

void finish_with_error(MYSQL* con)
{
	fprintf(stderr, "%s\n", mysql_error(con));
	mysql_close(con);
	exit(1);
}

int main()
{
	MYSQL mysql;
	mysql_init(&mysql);

	if (!mysql_real_connect(&mysql, "localhost", "root", "iot123", "madang", 3306, NULL, 0))
		printf("error \n");
	else
		printf("success \n");

	mysql_close(&mysql);


	//추가

	MYSQL* con = mysql_init(NULL);

	if (con == NULL)
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		exit(1);
	}

	if (mysql_real_connect(con, "localhost", "root", "iot123", NULL, 3306, NULL, 0) == NULL)
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}
	/*
	if (mysql_query(con, "CREATE DATABASE testdb"))
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}

	//추가
	if (mysql_query(con, "USE testdb"))
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}

	if (mysql_query(con, "CREATE TABLE Cars(Id INT, Name TEXT, Price INT)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(1,'Audi',52642)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(2,'Mercedes',57127)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(3,'Skoda',9000)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(4,'Volvo',29000)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(5,'Bentley',350000)")) {
		finish_with_error(con);
	}

	if (mysql_query(con, "INSERT INTO Cars VALUES(6,'Citroen',21000)")) {
		finish_with_error(con);
	}
	*/
	//조회동작
	//cout << endl;
	/*
	if (mysql_query(con, "USE testdb"))
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}

	if (mysql_query(con, "SELECT * FROM Cars"))
	{
		finish_with_error(con);
	}

	MYSQL_RES* result = mysql_store_result(con);

	if (result == NULL)
	{
		finish_with_error(con);
	}

	int num_fields = mysql_num_fields(result);

	MYSQL_ROW row;

	while ((row = mysql_fetch_row(result)))
	{
		for (int i = 0; i < num_fields; i++)
		{
			printf("%s ", row[i] ? row[i] : "NULL");
		}
		printf("\n");
	}
	
	mysql_free_result(result);
	mysql_close(con);
	*/
	return 0;
}
