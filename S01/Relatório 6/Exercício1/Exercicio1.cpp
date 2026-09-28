#include <iostream>
#include <string>
using namespace std;

class Banda
{
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival)
    {
        cout << "A banda " << nome << " esta duelando contra " << rival.nome << "!" << endl;
        rival.energia = rival.energia - potenciaSom;
    }
};

int main()
{
    Banda banda1;
    banda1.nome = "Twice";
    banda1.integrantes = 7;
    banda1.potenciaSom = 25.5;
    banda1.energia = 100;

    Banda banda2;
    banda2.nome = "Bts";
    banda2.integrantes = 9;
    banda2.potenciaSom = 35.0;
    banda2.energia = 100;
    //não são bandas...são grupos...mas não me recordo de muitas bandas :/
    banda1.duelar(banda2);

    cout << endl << "Status final:" << endl;
    cout << banda1.nome << " - Energia: " << banda1.energia << endl;
    cout << banda2.nome << " - Energia: " << banda2.energia << endl;

    return 0;
}