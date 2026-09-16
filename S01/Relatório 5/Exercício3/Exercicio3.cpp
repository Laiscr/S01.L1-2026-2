#include <iostream>
#include <iomanip>
using namespace std;

int main() 
{
    float capacidade_maxima;
    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade_maxima;
    cout << endl;

    float peso_atual = 0.0;
    int opcao;

    while (true) 
    {
        cout << endl << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;
        cout << endl;

        if (opcao == 1) 
        {
            cout << fixed << setprecision(2) << endl;
            cout << endl << "Carga Atual: " << peso_atual << " kg / " << capacidade_maxima << " kg" << endl;
            cout << endl << "Espaco Disponivel: " << capacidade_maxima - peso_atual << " kg" << endl;
        } 
        else if (opcao == 2) 
        {
            float peso_pacote;
            cout << endl << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> peso_pacote;
            if (peso_atual + peso_pacote > capacidade_maxima) 
            {
                cout << endl << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } 
            else 
            {
                peso_atual = peso_atual + peso_pacote;
                cout << endl << "Pacote adicionado com sucesso!" << endl;
            }
        } 
        else if (opcao == 3) 
        {
            float peso_remover;
            cout << endl << "Digite o peso a ser removido (kg): ";
            cin >> peso_remover;

            if (peso_remover > peso_atual) 
            {
                cout << endl << "Alerta: Peso a remover maior que a carga atual! Operacao cancelada." << endl;
            } 
            else 
            {
                peso_atual = peso_atual - peso_remover;
                cout << endl << "Pacote removido com sucesso!" << endl;
            }
        } 
        else if (opcao == 4) 
        {
            cout << endl << "Encerrando sistema de telemetria..." << endl;
            break;
        }
    }
    return 0;
}