#include <iostream>
#include <string>
#include <thread>
#include <chrono>
#include <algorithm>
#include <vector>
#include <numeric>
#include <iterator>
#include <mutex>
#include <thread>

using namespace std;

class SummWork
{
private:
	int mass[5];
	int array[5];
	int result[5];
public:
	void get(int * mass_, int * array_)
	{
		for (int i = 0; i < 5; i++)
		{
			mass[i] = mass_[i];
			array[i] = array_[i];
		}
	}
	int * operator+()
	{
		for (int i = 0; i < 5; i++)
			result[i] = mass[i] + array[i];
		return & result[0];
	}
	int * operator+(int a)
	{
		for (int i = 0; i < 5; i++)
			result[i] = mass[i] + a;
		return & result[0];
	}
};

class Mass
{
private: int mass[5];
		 int mass1[5];
		 int result[5];
public: 
	Mass(int * m)
	{
		for (int i = 0; i < 5; i++)
			mass[i] = m[i];
	}
	int * operator+(int *mass)
	{
		for (int i = 0; i < 5; i++)
			result[i] = mass[i] + mass1[i];
		return & result[0];
	}
	Mass * operator+(Mass &l)
	{
		cout << "l.mass" << endl;
		cout << *(l.mass + 1) + 1 << endl;
		return & Mass(l.mass + 9);
	};
		~ Mass() {};
};

class Matrix
{
private: int massiv[5];
public:
	friend ostream &operator << (ostream & cout, Matrix & temp);

	void input()
	{
		for (int i = 0; i < 5; i++)
		{
			massiv[i] = i;
		}
	}
	Matrix operator+(const Matrix & rhs)
	{
		Matrix result(*this);
		for (int i = 0; i < 5; i++)
		{
			result.massiv[i] += rhs.massiv[i];
		}
		return result;
	}
};

struct Complex
{
	Complex(float r, float i) : re(r), im(i) {}
	Complex operator+(Complex & thr)
	{
		Complex result(*this);
		result.re += thr.re;
		result.im += thr.im;
		return result;
	}
	void Display() { cout << re << ", " << im << endl; }
private:
	float re, im;
};

ostream &operator << (ostream & cout, Matrix & temp)
{
	for (int i = 0; i < 5; i++)
	{
		cout << temp.massiv[i] << " ";
	}
	cout << endl;
	return cout;
}
struct NM
{
	char* name;
	char* surname;
	int age;
	void NM_print(NM* p)
	{
		cout << p->age << endl;
		cout << p->name << endl;
		cout << p->surname << endl;
	}
};

int function(int = 0, int = 0, char* = 0)
{
	cout << "function" << endl;
	return 0;
}

class X
{
private: int x = 1, y = 1;
public: 
	void foo(initializer_list<int> list)
	{
		cout << list.size() << endl;
	}
	void set(int x, int y)
	{
		X::x = x;
		X::y = y;
	}
	void get()
	{
		cout << "x = " << x << " " << " y = " << y << endl;
	}
};

inline int pod(int a, int b)
{
	return a + b;
}

int po1(int a, int b)
{
	return a + b;
}

int poka(int = 0, int = 0, char* =0)
{
	return 0;
}

void kekstructor(initializer_list<int> list)
{
	int lc;
	lc = *list.begin() + *(list.begin() + 1);
	cout << lc << endl;
}

void vivod()
{
	for (int i = 0; i < 1000;i++)
	{
		cout << i << " ";
		if (i % 100 == 0)
			cout << endl;
	}
}

int main()
{
	/*
	chrono::time_point<chrono::system_clock> start, end, sq, eq;
	start = chrono::system_clock::now();
	for (int i = 0; i < 10000;i++)
	pod(1, 1);
	end = chrono::system_clock::now();
	int elapsed_mic = chrono::duration_cast<chrono::nanoseconds> (end - start).count();
	cout << elapsed_mic << endl;
	sq = chrono::system_clock::now();
	for (int i = 0; i < 10000;i++)
	po1(1, 1);
	eq = chrono::system_clock::now();
	elapsed_mic = chrono::duration_cast<chrono::nanoseconds> (eq - sq).count();
	cout << elapsed_mic << endl;
	X g;
	g.set(2,0);
	g.get();
	//function(1,2,"kek");
	char ch;
	do { // пропускает пробелы за исключением '\n'
		if (!cin.get(ch)) return 1;
	} while (ch != '\n' && isspace(ch));
	NM av[3];
	av[1].name = "Sergiq";
	av[1].age = 19;
	av[1].surname = "KEK";
	av[1].NM_print(&av[1]);
	int mass3[10][10][10];
	int array[5] = {1, 2, 3, 4, 5};
	int mass[5] = {1, 10, 8, 9, 4};
	Mass l(array);
	Mass p(mass);
	cout << (l + p) << endl;
	//for (int i = 0; i < 5; i++)
	//cout << (l + array)[i] << " ";
	cout << endl;
	SummWork s;
	s.get(mass,array);
	for (int i = 0; i < 5;i++)
		cout << s.operator+() [i] << " ";
	cout << endl;
	for (int i = 0; i < 5; i++)
		cout << (s + 5)[i] << " ";
	cout << endl;
	Matrix z, x, y;
	z.input(); x.input();
	y = z + x;
	cout << y << endl;
	Complex a(1.2, 3.4);
	Complex b(5.6, 7.8);
	Complex c(0.0, 0.0);
	c = a + b;
	c.Display();
	for (int i = 0; i < 256; i++)
	{
		cout << i << " - " << (char)i << " ";
		if (i % 10 == 0)
			cout << endl;
	}
	*/
	{
		int a[10], *p;
		int c[4] = { 5 };
		for (int i = 0; i < 10; i++)
		{
			a[i] = i;
		}
		for (int i = 0; i < 4;i++)
			cout << c[i] << endl;
		for (p = a; p != a + 10; p++)
			cout << *p << " ";
	}
	{
		int mymass[] = { 1,2,3,3,7,4,5,8 }; int * p;
		cout << endl;
		p = find(mymass, mymass + 8, 3);
		if (p == mymass + 8)
		{
			cout << "NTF\n";
		}
		else {
			cout << "F\n";
			if (p == mymass)
				cout << " THE FIRST"; else
			{
				cout << " atfer" << *--p;
				cout << endl;
			}
		}
	}
	{/*
		int * a = new int[10], *b;
		b = a;
		delete[] b;
		//Solution 
		auto_ptr<int> as(new int), bs;
		*as.get() = 123;
		cout << "*as.get() = " << *as.get() << endl;
		b = a;
		if (as.get() == NULL)
			cout << "As a rsut N" << endl;
		cout << *bs.get() << endl;
		ostream_iterator<int>(cout, " ")*/
	}
	{
		vector<int> v;
		int m[] = {1,4,5,3,7,4,8};
		v = {1,2,5};
		int sum = 0;
		sort(m, m + 7, greater<int>());
		copy(m, m + 7, ostream_iterator<int>(cout," "));
		cout << endl;
		sum = accumulate(m, m+3, sum);
		sum = accumulate(v.begin(),v.end(),1);
		cout << sum;
		chrono::time_point<chrono::system_clock> start, end;
		start = chrono::system_clock::now();
		pod(10, 9);
		cout << endl;
		end = chrono::system_clock::now();
		int times = chrono::system_clock::to_time_t(start);
		cout << times << endl;
		times = chrono::system_clock::to_time_t(end);
		cout << times << endl;
		mutex mut;
		mut.lock();
		cout << "GG" << endl;
		mut.unlock();
		// Списки инициализации
		struct inr
		{
			int a;
			int s;
		};
		inr l;
		kekstructor({1,2,1,2,4,5,6,9});
	}
	{
		thread th(vivod);
		th.join();
	}
	system("pause");
}
