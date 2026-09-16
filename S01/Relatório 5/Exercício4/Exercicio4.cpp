#include <iostream>
#include <iomanip>
using namespace std;

int main() 
{
    int matriz_solar[5][5] = {{0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}};
    int opcao;

    while (true) 
    {
        cout << endl << "=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        cout << endl;

        if (opcao == 1) 
        {
            int f, c;
            cout << endl << "Digite a fileira (0-4): ";
            cin >> f;
            cout << endl << "Digite a coluna (0-4): ";
            cin >> c;
            if (matriz_solar[f][c] == 0) 
            {
                matriz_solar[f][c] = 1;
                cout << endl << "Sucesso: Celula solar ativada!" << endl;
            } 
            else 
            {
                cout << endl << "Erro: Celula solar ja esta em operacao!" << endl;
            }
        } 
        else if (opcao == 2) 
        {
            cout << endl << "--- Mapa da Matriz Solar ---" << endl;
            for (int i = 0; i < 5; i++) 
            {
                for (int j = 0; j < 5; j++) 
                {
                    cout << "[" << matriz_solar[i][j] << "] ";
                }
                cout << endl;
            }
        } 
        else if (opcao == 3) 
        {
            break;
        }
    }

    int ativas = 0;
    for (int i = 0; i < 5; i++) 
    {
        for (int j = 0; j < 5; j++) 
        {
            if (matriz_solar[i][j] == 1) 
            {
                ativas = ativas + 1;
            }
        }
    }
    int inativas = 25 - ativas;
    float percentual = (ativas / 25.0) * 100;

    cout << endl << "=== RELATORIO FINAL DE OPERACAO ===" << endl;
    cout << "Total de celulas ATIVAS: " << ativas << endl;
    cout << "Total de celulas INATIVAS: " << inativas << endl;
    cout << fixed << setprecision(2);
    cout << "Capacidade Operacional: " << percentual << "%" << endl;

    return 0;
}