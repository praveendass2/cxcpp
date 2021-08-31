#include <iostream>
#include <chrono>
#include <thread>

class Calc
{
public:
	int add(int a, int b);
	int diff(int a, int b);
};

int Calc::add(int a, int b)
{
	//std::chrono::milliseconds timespan(5000);
	//std::this_thread::sleep_for(timespan);
	return a + b;
}

int Calc::diff(int a, int b)
{
	//std::chrono::milliseconds timespan(2000);
	//std::this_thread::sleep_for(timespan);
	return a - b;
}

int main()
{
	Calc calc;
	std::cout<<"Add : " << std::to_string(calc.add(1, 2)) << "\n";
}
