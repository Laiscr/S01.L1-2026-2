#include <iostream>
#include <string>
using namespace std;

class LinkSocial
{
private:
    string nome;
    string arcana;
    int rank;

public:
    void setNome(string nome_set) { nome = nome_set; }
    void setArcana(string arcana_set) { arcana = arcana_set; }
    void setRank(int rank_set) { rank = rank_set; }

    string getNome() { return nome; }
    string getArcana() { return arcana; }
    int getRank() { return rank; }

    void subirRank() { rank = rank + 1; }
};

int main()
{
    LinkSocial link;
    link.setNome("Hinako Shimizu"); //de silent hill f :D
    link.setArcana("The Silence"); //tive que inventar uma arcana pra manter a Hinako ;-;
    link.setRank(1);
    link.subirRank();

    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}