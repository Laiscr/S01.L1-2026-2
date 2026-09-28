#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Hobbit
{
public:
    string nome;

    virtual void fazerAtividade()
    {
        cout << "O hobbit " << nome << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }

    virtual ~Hobbit() {}
};

class Jardineiro : public Hobbit
{
public:
    void fazerAtividade() override
    {
        cout << "O jardineiro " << nome << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit
{
public:
    void fazerAtividade() override
    {
        cout << "O cozinheiro " << nome << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit
{
public:
    void fazerAtividade() override
    {
        cout << "O fazendeiro " << nome << " esta colhendo vegetais e hortalicas em suas terras!" << endl;
    }
};

int main()
{
    vector<Hobbit*> hobbits;

    hobbits.push_back(new Jardineiro());
    hobbits[0]->nome = "Sam";

    hobbits.push_back(new Cozinheiro());
    hobbits[1]->nome = "Rosie";

    hobbits.push_back(new Fazendeiro());
    hobbits[2]->nome = "Bilbo"; //só conehço esse mano :D o restante inventei moda

    for (Hobbit* h : hobbits)
    {
        h->fazerAtividade();
    }

    for (Hobbit* h : hobbits)
    {
        delete h;
    }

    return 0;
}