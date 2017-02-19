// lab1.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"

using namespace std;

typedef map<string, vector<int>> DataBase;

ostream & operator<<(ostream &out, const vector<int> & obj)
{
	for (auto it = obj.begin(); it != obj.end(); ++it)
	{
		out << *it << ' ';
	}
	return out;
}

void ReadDB(fstream &file, DataBase &dataBase)
{
	string str;
	string nameOfAutor;
	vector<string> tempVector;
	while (getline(file, str))
	{
		boost::split(tempVector, str, boost::is_any_of(","));
		if (*(tempVector[4].begin()) == '\"')
		{
			nameOfAutor = tempVector[4].substr(1, tempVector[4].length() - 2);
			int id = stoi(tempVector[0]);
			auto findInDataBase = dataBase.find(nameOfAutor);
			if (findInDataBase == dataBase.end())
			{
				vector<int> vectorOfIds;
				vectorOfIds.push_back(id);
				dataBase.emplace(nameOfAutor, vectorOfIds);
			}
			else
			{
				findInDataBase->second.push_back(id);
			}
		}
		tempVector.clear();
		
	}
}
bool FindInDB(DataBase &data, string nameOfAutor)
{
	auto findInDataBase = data.find(nameOfAutor);
	if (findInDataBase != data.end())
	{
		cout << "Record id: " << findInDataBase->second << endl;
		return true;
	}
	return false;
}
int main()
{
	fstream dataBase("db.csv");
	if (!dataBase.is_open())
	{
		cout << "Error reading file\n";
		return 1;
	}
	if (!dataBase.peek() == ifstream::traits_type::eof())
	{
		cout << "File is empty\n";
		return 1;
	}
	string str;
	DataBase dataBaseOfNames;
	ReadDB(dataBase, dataBaseOfNames);
	cout << "You can enter data: \n";
	while (getline(cin, str))
	{
		if (!FindInDB(dataBaseOfNames, str))
		{
			cout << "This name has been not found\n";
		}
	}
    return 0;
}