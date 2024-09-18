#include <iostream>
#include <vector>
#include <algorithm> 
#include <numeric>   
#include <iomanip>   

using namespace std;

int main() {
    int n;
    
    cout << "¿Cuántos datos va a ingresar?: ";
    cin >> n;

    vector<int> datos(n);

    for (int i = 0; i < n; ++i) {
        cout << "Ingrese el dato " << i + 1 << ": ";
        cin >> datos[i];
    }

    vector<int> valores_unicos = datos;
    sort(valores_unicos.begin(), valores_unicos.end());
    valores_unicos.erase(unique(valores_unicos.begin(), valores_unicos.end()), valores_unicos.end());

    vector<int> frecuencia_absoluta;
    vector<int> frecuencia_acumulada;
    vector<double> frecuencia_relativa;
    vector<double> frecuencia_relativa_acumulada;
    vector<double> porcentajes;

    int total_datos = datos.size();
    int acumulada_abs = 0;
    double acumulada_rel = 0.0;

    for (int valor : valores_unicos) {
        int count = count_if(datos.begin(), datos.end(), [valor](int x) { return x == valor; });
        frecuencia_absoluta.push_back(count);

        acumulada_abs += count;
        frecuencia_acumulada.push_back(acumulada_abs);

        double frec_relativa = static_cast<double>(count) / total_datos;
        frecuencia_relativa.push_back(frec_relativa);

        acumulada_rel += frec_relativa;
        frecuencia_relativa_acumulada.push_back(acumulada_rel);

        porcentajes.push_back(frec_relativa * 100);
    }

    cout << setw(10) << "Dato" 
         << setw(10) << "FA" 
         << setw(15) << "FA Acum" 
         << setw(10) << "FR" 
         << setw(15) << "FR Acum" 
         << setw(10) << "%" << endl;

    for (size_t i = 0; i < valores_unicos.size(); ++i) {
        cout << setw(10) << valores_unicos[i] 
             << setw(10) << frecuencia_absoluta[i] 
             << setw(15) << frecuencia_acumulada[i] 
             << fixed << setprecision(4) << setw(10) << frecuencia_relativa[i] 
             << fixed << setprecision(4) << setw(15) << frecuencia_relativa_acumulada[i] 
             << fixed << setprecision(2) << setw(10) << porcentajes[i] << "%" << endl;
    }

    cout << setw(10) << "Total:"
         << setw(10) << accumulate(frecuencia_absoluta.begin(), frecuencia_absoluta.end(), 0)
         << setw(15) << " " 
         << fixed << setprecision(4) << setw(10) << accumulate(frecuencia_relativa.begin(), frecuencia_relativa.end(), 0.0)
         << setw(15) << " "
         << fixed << setprecision(2) << setw(10) << accumulate(porcentajes.begin(), porcentajes.end(), 0.0) << "%" << endl;

    return 0;
}