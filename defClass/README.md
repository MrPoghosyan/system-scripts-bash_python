# defClass — C++ Class Header Generator

[ARM] Պարզ և արագ գործիք C++ դասերի (class) համար `.hpp` ֆայլեր ստեղծելու համար։  
[ENG] A simple and fast utility to generate `.hpp` header files for C++ classes.

---

## 🚀 Compilation / Կոմպիլյացիա
```bash
cc -Wall -Wextra -Werror defClass.c -o defClass
````

---

## 🇦🇲 Հայերեն նկարագրություն

Այս ծրագիրը ավտոմատացնում է C++ header ֆայլերի ստեղծումը։ Այն ստեղծում է `.hpp` ֆայլ, որը պարունակում է․

* Header Guards (`#ifndef`, `#define`)՝ ֆայլի անունը մեծատառ դարձնելով
* Դասի (class) կառուցվածքը
* Պաշտպանություն գոյություն ունեցող ֆայլերը պատահական ջնջելուց (ստուգում է `access()` ֆունկցիայով)

### Նոր կանոններ Orthodox Canonical Form
Այսուհետ ձեր բոլոր դասերը նախագծված կլինեն Orthodox Canonical ձևով,
եթե այլ կերպ հստակ նշված չլինի։ Այնուհետև դրանք կիրականացնեն ստորև նշված չորս պարտադիր անդամ ֆունկցիաները՝
* Լռելյայն կոնստրուկտոր
* Պատճենման կոնստրուկտոր
* Պատճենման վերագրման օպերատոր
* Դեստրուկտոր

### Ինչպե՞ս օգտագործել ցանկացած տեղից (Installation)

Որպեսզի կարողանաք կանչել `defClass` հրամանը ցանկացած թղթապանակից, ընտրեք տարբերակներից մեկը․

**Տարբերակ 1: Համակարգային տեղադրում (Global)**

```bash
sudo cp defClass /usr/local/bin/
```

**Տարբերակ 2: Տեղային տեղադրում (Local)**

1. Ստեղծեք `bin` թղթապանակ․

```bash
mkdir -p ~/bin
```

2. Տեղափոխեք ֆայլը․

```bash
cp defClass ~/bin/
```

3. Ավելացրեք սա ձեր `~/.bashrc` կամ `~/.zshrc` ֆայլի վերջում․

```bash
export PATH="$HOME/bin:$PATH"
```

4. Թարմացրեք կարգավորումները․

```bash
source ~/.bashrc
```

---

## 🇺🇸 English Description

This utility automates the creation of C++ header files. It generates a `.hpp` file including:

* Header Guards (`#ifndef`, `#define`) with the filename converted to uppercase
* Basic class structure
* Overwrite protection (checks if the file exists using `access()` before creating)

### New rules Orthodox Canonical Form
From now on, all your classes must be designed in the Orthodox Canonical Form,
unless explicitly stated otherwise. They will then implement the four required member
functions below:
* Default constructor
* Copy constructor
* Copy assignment operator
* Destructor

### How to install it globally

To use the `defClass` command from any directory, choose one of the following methods:

**Method 1: System-wide Installation (Recommended)**

```bash
sudo cp defClass /usr/local/bin/
```

**Method 2: User-local Installation**

1. Create a `bin` folder:

```bash
mkdir -p ~/bin
```

2. Move the executable:

```bash
cp defClass ~/bin/
```

3. Add this line to your `~/.bashrc` or `~/.zshrc`:

```bash
export PATH="$HOME/bin:$PATH"
```

4. Refresh your shell:

```bash
source ~/.bashrc
```

---

## 🛠 Usage / Օգտագործում

```bash
defClass MyClassName
```

**Example output / Արդյունքի օրինակ:**

```
[+] Created file: MyClassName.hpp
[+] Class name: MyClassName
```

---

## 📄 Generated File Example / Ֆայլի օրինակ

`defClass Player` կանչելու դեպքում կստեղծվի `Player.hpp`․

```cpp
#ifndef PLAYER_HPP
#define PLAYER_HPP

class Player
{
        //
};

#endif /* PLAYER_HPP */


## ⚙️ Makefile Overview / Makefile-ի նկարագրություն

Այս նախագիծը ներառում է Makefile, որը հեշտացնում է ծրագրի կոմպիլյացիան, տեղադրումը և կառավարումը։

---

## 🇦🇲 Հայերեն նկարագրություն

Makefile-ը նախատեսված է `defClass` ծրագրի ավտոմատ կառավարման համար։

### 🔧 Հիմնական փոփոխականներ

- `NAME` — ստեղծվող executable ֆայլի անունը (`defClass`)
- `CC` — կոմպիլյատոր (`cc`)
- `CFLAGS` — կոմպիլյացիայի ֆլագներ (`-Wall -Wextra -Werror`)
- `INSTALL_PATH` — տեղադրման ուղին (`/usr/local/bin`)
- `SRC` — source ֆայլ (`defClass.c`)

---

### 🛠 Հիմնական հրամաններ

**Կոմպիլյացիա**
```bash
make
````

**Ջնջել բինարը**

```bash
make clean
```

**Տեղադրել համակարգում (global)**

```bash
make install
```

**Ջնջել համակարգից**

```bash
make uninstall
```

**Վերակոմպիլյացիա (rebuild)**

```bash
make re
```

---

## 🇺🇸 English Description

This project includes a Makefile to simplify compilation, installation, and management of the `defClass` program.

### 🔧 Main variables

* `NAME` — output executable name (`defClass`)
* `CC` — compiler (`cc`)
* `CFLAGS` — compilation flags (`-Wall -Wextra -Werror`)
* `INSTALL_PATH` — installation path (`/usr/local/bin`)
* `SRC` — source file (`defClass.c`)

---

### 🛠 Available commands

**Compile the program**

```bash
make
```

**Remove the binary**

```bash
make clean
```

**Install globally**

```bash
make install
```

**Uninstall from system**

```bash
make uninstall
```

**Rebuild**

```bash
make re
```
