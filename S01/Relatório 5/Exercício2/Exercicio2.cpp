#include <iostream>
using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) 
{
    float resultado = 1.0;
    for (int i = 0; i < tamanho; i++) {
        resultado = resultado * probabilidades[i];
    }
    return resultado;
}

int main() 
{
    int n;
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    float probabilidades[100];
    for (int i = 0; i < n; i++) {
        cout << endl << "Digite a probabilidade do componente " << i + 1 << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, n);
    cout << endl << "Confiabilidade total do sistema: " << confiabilidade << " (" << confiabilidade * 100 << "%)" << endl;
    return 0;
}