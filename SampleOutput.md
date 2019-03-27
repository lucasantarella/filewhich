# FileWhich Example Usage
### Luca Santarella

## Directories & Files

```
.
├── dir1
│   ├── dir3
│   │   └── test3.txt
│   └── test.txt
├── dir2
│   └── test2.txt
└── test.txt

3 directories, 4 files
```

## Test 1
### Shell Code

```bash
$ filewhich.sh -p "./dir1" test.txt
```

### Output

```bash
./dir1/test.txt
```

## Test 2
### Shell Code

```bash
$ filewhich.sh -p "./dir1:." test.txt
```

### Output

```bash
./dir1/test.txt
```


## Test 3
### Shell Code

```bash
$ filewhich.sh -p ".:./dir1" test.txt
```

### Output

```bash
./test.txt
```

## Test 4
### Shell Code

```bash
$ filewhich.sh -a -p ".:./dir1" test.txt
```

### Output

```bash
./test.txt
./dir1/test.txt
```

