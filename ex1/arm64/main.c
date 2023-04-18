unsigned *UART0 = (unsigned *) 0x09000000;

void print(const char *s, unsigned *dest) {
    for (int i = 0; s[i] != '\0'; i++) {
        *dest = s[i];
    }
}

void main() {
    print("Hello World!\n", UART0);
}
