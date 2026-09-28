#include <iostream>
#include <string>
using namespace std;

class MembroInatel
{
public:
    string nome;

    virtual void seApresentar()
    {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }

    virtual ~MembroInatel() {}
};

class Aluno : public MembroInatel
{
public:
    string curso;

    void seApresentar() override
    {
        cout << "Meu nome e " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel
{
public:
    string disciplina;

    void seApresentar() override
    {
        cout << "Meu nome e " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main()
{
    Aluno aluno;
    aluno.nome = "Lais";
    aluno.curso = "Engenharia de Software";
    aluno.seApresentar();

    Professor professor;
    professor.nome = "Ruan Patrick";
    professor.disciplina = "Paradigmas da Programacao";
    professor.seApresentar();

    return 0;
}