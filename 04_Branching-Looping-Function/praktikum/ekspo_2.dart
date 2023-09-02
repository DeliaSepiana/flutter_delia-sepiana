// 2. Buatlah sebuah program untuk mencetak tabel perkalian dengan input 9
import 'dart:io';

void main() {
  int input = 9; 


  for (int i = 1; i <= input; i++) {
    for (int j = 1; j <= input; j++) {
      int bilangan = i * j; 
      String formatBilangan = bilangan.toString().padLeft(2, ' '); 
      stdout.write(formatBilangan + ' '); 
    }
    print(""); 
  }
}

