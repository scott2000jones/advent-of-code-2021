#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int part1(FILE *fp, int num_bits) {
    char* buffer = malloc(num_bits+1);
    char* gamma = malloc(num_bits);
    char* epsilon = malloc(num_bits);
    int count_one, count_zero;
    int line_count;
    for (int bit = 0; bit < num_bits; bit++) {
        line_count = 0;
        fseek(fp, 0, SEEK_SET);
        count_one = 0;
        count_zero = 0;
        while(fscanf(fp, "%s", buffer) != EOF) {
            if (buffer[bit] == '1') count_one++;
            if (buffer[bit] == '0') count_zero++;
            line_count++;
        }
        if (count_one > count_zero) {
            gamma[bit] = '1';
            epsilon[bit] = '0';
        } else {
            gamma[bit] = '0';
            epsilon[bit] = '1';
        }
    }
    printf("Part1\ngamma: %s\nepsilon: %s\n\n", gamma, epsilon);
    return line_count;
}

void part2(FILE *fp, int num_bits, int line_count) {
    char* buffer = malloc(num_bits+1);
    int discarded_lines[line_count]; // 1 if line has been discarded, otherwise 0
    for (int i = 0; i < line_count; i++) discarded_lines[i] = 0;

    // oxygen generator rating
    int one_left = 0;
    int bit = 0;
    while (true) {
        fseek(fp, 0, SEEK_SET);
        while(fscanf(fp, "%s", buffer) != EOF) {
            if (buffer[bit] == '1') count_one++;
            if (buffer[bit] == '0') count_zero++;
        }
        int most_common;
        if (count_one > count_zero) {
            most_common = '1';
        } else {
            most_common = '0';
        }
        fseek(fp, 0, SEEK_SET);
        int line = 0;
        while(fscanf(fp, "%s", buffer) != EOF) {
            if (buffer[bit] != most_common) discarded_lines[line] = 1;
            line++;
        }
        int num_left;
        for (int i = 0; i < line_count; i++) {
            if (discarded_lines[i] == 0) num_left++;
        }
        if (num_left == 1 || bit++ > num_bits) break;
    }
    
    fseek(fp, 0, SEEK_SET);
    int line = 0;
    while(fscanf(fp, "%s", buffer) != EOF) {
        if (line) discarded_lines[line] = 1;
        line++;
    }

    printf("Part2\nO2 gen rating: %s");
}

int main(int argc, char *argv[]) {
    if (argc != 3) return 1;
    FILE *fp = fopen(argv[1], "r");
    int lc = part1(fp, itoa(argv[2]));
    part2(fp, itoa(argv[2]), lc);
    fclose(fp);
    return 0;
}