#include<stdio.h>
#include<stdlib.h>

int part1(FILE *fp) {  
    fseek(fp, 0, SEEK_SET);
    char* buffer = malloc(sizeof(int));
    int inc_count = 0;
    int prev = -1;
    while(fscanf(fp, "%s", buffer) != EOF) {
        int new = atoi(buffer);
        if (new > prev && prev != -1) inc_count++;
        prev = new;
    } 
    return inc_count;
}

int part2(FILE *fp) {
    fseek(fp, 0, SEEK_SET);
    char* buffer = malloc(sizeof(int));
    int inc_count = 0;
    int index = 0;
    int window[3];
    while(fscanf(fp, "%s", buffer) != EOF) {
        int new = atoi(buffer);
        if (index >= 3 && window[2] + window[1] + window[0] > 0 && new + window[0] + window[1] > window[2] + window[1] + window[0]) 
            inc_count++;
        window[2] = window[1];
        window[1] = window[0];
        window[0] = new;
        index++;
    } 
    return inc_count;
}

int main(int argc, char *argv[]) {
    if (argc != 2) return 1;
    FILE *fp = fopen(argv[1], "r");
    printf("Part1: %d increases\n", part1(fp));
    printf("Part2: %d increases\n", part2(fp));
    fclose(fp);
    return 0;
}