#include <conio.h>
#include <locale>
#include <iostream>
#define N 50


extern "C" int __fastcall find_num(char* p_line, char* p_line_2, int p_len);

int main()
{
	char* line = new char[N];
	char* sym = new char[N];
	int len;
	std::cout << "Input line: ";
	std::cin >> line;
	std::cout << "Input symbol: ";
	std::cin >> sym;
	if (strlen(sym) <= 1) {
		int ans = find_num(line, sym, strlen(line));
		sym[strlen(line)] = '\0';
		std::cout << "New line: " << sym << '\n';
	}
	else std::cout << "Check Input\n";
	return 0;
}

