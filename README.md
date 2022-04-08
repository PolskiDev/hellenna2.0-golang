# Hellenna 2.0 - Programming Language
<center><img src="docs/hellenna-lang.png" height="200px"/></center>
  


Hellenna 2.0 is a rewrite of the old Hellenna 1.0 programming language, now Hellenna 2.0 is totally written in Lua. Hellenna is a programming language that compiles to GO, Rust and Kotlin (JVM) programming languages. By the way, the same source-code with some modifications and adaptations can be compiled to binary format with <u>minimal compilation time</u> <i>(Hellenna/GO)</i> or <u>low-energy</u> consumption <i>(Hellenna/Rust)</i>. Oops! Do not forget that Hellenna also supports source-code compilation to <u>Java Virtual Machine</u> (JVM) through Kotlin.


<center><i>Developed by Gabriel Margarido</i></center>

#### - Install LuaVM for macOS (Intel-based and Apple Silicon)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install lua
```


## Binary version
#### - Install LuaVM for MacOS (Intel-based x64)
Double click on:  <b>*img/Lua-interpreter-5.3.5-4.dmg*</b>, then reboot the operating system.
  

#### - Install LuaVM for Windows 32-bit and 64-bit
Double click on:  <b>*img\\LuaForWindows_v5.1.4-46.exe*</b>, then reboot the operating system.


## Compilation
### 0A. Transpile Hellenna program:
```
Generate object language source code (Windows and macOS):
lua helc helloworld.x --transpile helloworld

Generate object language source code (Compiled from source)
./lua helc helloworld.x --transpile helloworld
```
  
### 0B. Compile Hellenna program:
```
Generate executable binary (Windows and macOS):
lua helc helloworld.x --build helloworld

Generate executable binary (Compiled from source)
./lua helc helloworld.x --build helloworld
```
  
### 0C. <u>Run</u> Hellenna program from source:
```
Generate executable binary and run (Windows and macOS):
lua helc helloworld.x --run helloworld

Generate executable binary and run (Compiled from source)
./lua helc helloworld.x --run helloworld
```
  
### 0C. <u>Compile</u> with <u>built-in</u> modules:
```
Generate executable binary (Windows and macOS):
lua helc helloworld-mod.x --transpile helloworld-mod
lua helc helloworld.x --build helloworld


Generate executable binary (Compiled from source)
./lua helc helloworld-mod.x --transpile helloworld-mod
./lua helc helloworld.x --build helloworld
```
  
  
### 0D. <u>Transpile</u> with <u>built-in</u> modules:
```
Generate executable binary (Windows and macOS):
lua helc helloworld-mod.x --transpile helloworld-mod
lua helc helloworld.x --transpile helloworld


Generate executable binary (Compiled from source)
./lua helc helloworld-mod.x --transpile helloworld-mod
./lua helc helloworld.x --transpile helloworld
```

## Main program
### 1A. Hellenna/GO (Native) <u>main program</u> source-code:  
#### Program files are always named with the following pattern: <u>*file*</u>.x
helloworld.x


```
namespace "helloworld"
    (package) "main"

    (import_go) "fmt"
    (import_go) "bufio"
    (import_go) "os"
    (import_go) "io"
    (import_go) "runtime"

    (import_module) "helloworld"



    fn("main:void")
        Console.WriteLine "&Hallo Welt"
        Console.WriteLine |"Hello "+"Darwin"|

    ..;

    
..?

```
  
### 1B. Hellenna/Rust (Native) <u>main program</u> source-code:  
#### Program files are always named with the following pattern: <u>*file*</u>.x
helloworld.x


```
namespace "helloworld"
    (import_rust) "std::fs::File"
    (import_rust) "std::io::prelude::*"
    (import_rust) "std::process::Command"

    (import_module) "helloworld"


    fn("main:void")
        Console.WriteLine "&Hello World"
        Console.WriteLine |"Hello "+"Darwin"|

    ..;

    
..?
```
  

### 1C. Hellenna/Kotlin (JVM) <u>main program</u> source-code:  
#### Program files are always named with the following pattern: <u>*file*</u>.x
helloworld.x
   
```
namespace "helloworld"
    (package) "com.gabrielmargarido.hellenna.jvm"
    
    (import_java) "java.lang.*"
    (import_java) "java.io.*"
    (import_java) "java.util.*"

    (import_module) "helloworld"



    fn("main:void")
        Console.WriteLine "&Hallo Welt"
        Console.WriteLine |"Hello "+"Darwin"|
    ..;
    
..?
```

## Modules
### 1.1 <u>Module</u> source-code:  
#### Modules are always named with the following pattern: <u>*file*</u>-mod.x

helloworld-mod.x

```
module "helloworld"
    Console.WriteLine("&It came from the module")

..?
```

  

### 2. Comments  
  
```
#@ My little comment
-- My little comment
```
  
### 3. Print on the screen

A. This is how to print strings in *Hellenna 2.0*  
```
Console.WriteLine("Hello world")

Console.Write("Hello world")
```

B. This is how to print variables on the screen **($)** or **not**.  
```
Console.WriteLine |$msg|
Console.Write |$msg|

Console.WriteLine |msg|
Console.Write |msg|
```
  
B2. <u>*This is how to print return variables on the screen</u> **(@)**.*  
Return variable is a kind of variable that stores a returned value from a function,
its identificator/name is preceeded by an **(@)**. By this way, it's normally used the |@name| notation. Return variables must be located inside pipes | |.    
```
Console.WriteLine |@msg|
Console.Write |@msg|

```
  
  
### C1. Variable, Array, List, Table names are always declared between **| $x |**. To declare a variable, we use the method *let*.  

The **&** symbol is only used on a variable assign or function return to make a reference to a string, just like the **$** is used to make a reference to a variable at the declaration and assign. 

## C2. Hellenna 2.0 Data Types
<img src="datatype-table.png">
  
  
  
```
#@ String variable  (uses at beginning: &)
let ( |$msg:string|, "&Hello world")


#@ Variable-reference variable  (uses at beginning: $ or *nothing*)
let ( |$msg:<type>|, |$other_var| )


#@ Number variable  (uses at beginning: *nothing*)
let ( |$msg:uint64|, 132)
let ( |$msg:double|, 132.560356)
```

**Global and reassign variables**  
```
#@ Reassign string variable  (use at beginning: &)
var( |$msg|, "&Hello world")


#@ Reassign variable-reference variable  (use at beginning: $ or *nothing*)
var ( |$msg|, |$other_var| )


#@ Reassing return variable-reference variable (use at beginning: @)
var ( |$msg|, |@other_var| )


#@ Reassign numeric variable  (use at beginning: $ or *nothing*)
var ( |$msg|, 132)
var ( |$msg|, 132.560356)
```

### D. Read data from user  

```
Console.ReadLine( |x:string| )

```

### F. Structures

**Conditionals:  if, elseif and else**  
```
declare_if {{ a == 3 }} >>
    -- CODE HERE

declare_elseif  {{ b < 7 }} >>
    -- CODE HERE

declare_else >>
    -- CODE HERE

..;

```


**Looping:  while, for, do-until**
```
declare_while {{ a < 7 }} >>
    -- CODE HERE

..;

```

If the step wasn't specified, it is always going to be (1).
*declare_for (|iterator|, begin,end)*  

```
declare_for(|i|, 0,100)
    -- CODE HERE    
..;

```

A simplified syntax for **declare_for(...)** is **times(|iterator|, number_of_times)**
```
times(|i|, 5)
    --CODE HERE
..;
```


If the step wasn't specified, it is always going to be (1).  
*loop forever*  
```
declare_loop;;
    --CODE HERE
    
    declare_if {{ a > 10 }} >>
        (break)
    ..;
    
..;
```

### G. Functions (private and public)  
  
**A. Public function**
```
fn ("hello", | a, b, c | )
    -- CODE HERE
    
..;
```



**(AB1) Call public/private <u>lonely</u> functions (args)**
```
Syscall('hello', |"George", "Julian", "Dean"|)
```
  
**(AB2) Call public/private <u>lonely</u> functions (no args)**
```
Syscall('hello')
```
  



### H. Return types

**String return**
```
ret "&This is my return"

```

**Variable return**
```
ret |$msg|

ret |msg|

```

**Number return**
```
ret (146)

ret |146|

```

### I. Increment and decrement

**Increment {  inc |var:number|  }**
```
increment |counter:1|

```

**Decrement {  dec |var:number|  }**
```
decrement |counter:1|

```

**Variable string concatenation**
```
let ( |$msg_1:string|, "&Hello ")
let ( |$msg_2:string|, "&world")

let ( |$final:string|, |msg_1 + msg_2|)

```


**Direct string concatenation**
```
let ( |$final_direct:string|, |"Hello "+"world"|)

```
Note: Double quotes are always used when between pipes |x|. 


**Boolean values (reserved keywords)**
- Import Hellenna standard libraries (.lua):
```
(import) "path.to.library"
```
- Import external modules **(.go)/(.rs)/(.kt)** - **helloworld-<u>mod</u>.go, helloworld-<u>mod</u>.rs, helloworld-<u>mod</u>.kt**
```
(import_module) "helloworld"
```
After statement (do)/(then):    >>

  

### K. Structures/Tables

**Create new structure (table/array)**  
Structures, arrays or tables are used to storage data. Unlike C, we can storage different types of data inside the same structure (struct). Structures can be also used as arrays. It's also possible to put a structure inside another structure, it means that we can create multidimensional arrays (structures).
  

  

**Public structures (GoLang)**
```
Std.table(|Dog|)
    Std.def(|height:float|)
    Std.def(|name:string|)
    Std.def(|age:int|)
    ...

Std.declare_end;;

```

**Object from structure**  
Creating new dog (Caramel) from structure (Dog), can be 
<u>used</u> or <u>not</u> the **($)** before the <u>class-object</u> name.
```
    Std.let(|$Dog.caramel|, {{ height:32.8, name:"Caramel", age:8 }} )
```
        
```
    Std.let(|Dog.caramel|, {{ height:32.8, name:"Caramel", age:8 }} )
```

  
  
### K. File manipulation
  
**Create blank file**
- Creating file from string
```
    File.CreateFile("&text.txt")
```
- Storing filename inside variable
```
    let ( |$filename:string|, "&text.txt|)

    File.CreateFile(|$filename|)
```

**Write to file**
- Write everything with strings
```
    File.WriteLine("&text.txt", "&Hello World")
```
- Storing filename inside variable
```
    let ( |$variable:string|, "&file.txt")

    File.WriteLine("&text.txt", |$variable|)
```

- Storing everything inside variables
```
    let ( |$x:string|, "&file.txt")
    let ( |$variable:string|, "&Hello world")

    File.WriteLine(|$x|, |$variable|)
```
  
  
**Append to file**
```
  
```
  
  
**Read from file**  
Reading file **text.txt** and storing inside variable **this_text**.  
```
File.ReadLine("&text.txt",|@this_text|)
 
Console.WriteLine(|@this_text|)
```
  
### Determine Operating System
#### All implementations (Universal)
```
System.ifwindows;;
    --WINDOWS CODE HERE
..;

```
```
System.ifdarwin;;
    --MACOS CODE HERE
..;
```
```
System.ifunix;;
    --UNIX CODE HERE
..;
```

#### Only available on Kotlin/JVM implementation
```
System.ifsolaris;;
    --SOLARIS CODE HERE
..;
```

#### GoLang and Kotlin/JVM implementations
```
System.iflinux;;
    --GNU/LINUX CODE HERE
..;
```


### Execute Shell Commands - (Available on GoLang and Kotlin/JVM implementation)  
```
System.Process("uname -a")

```
  
```
System.Process("start binary.exe")
```
  
  
### Execute External Script (Rust Implementation)
#### The name of your command interpreter is needed to run a shell command on unix systems, please use bash for "universal" compatibility.
```
System.UnixExternal("bash", "./script.sh")
```
  

#### On Windows/MS-DOS operating system, the name of command interpreter is not needed to run any shell command.
```
System.MSDOS_External("script.cmd")
```
  

### Throwing Errors 
```
ThrowError("This is an error")
```
  
  
- ### Working with arrays
**Standard Arrays**:
This type of array accepts an infinit number of elements,
as well as the memory can hold.
```
StdArray.new(|students:string|, {{ "Julia","Mike","Jean" }} )
```
  
  
**Numeric Arrays**:
This type of array only accepts a preset number of elements,
passed as first method argument.  
```
NumericArray.new(3, |students:string|, {{ "Julia","Mike","Jean" }} )
```
  
  
  
**Create new array with [size] positions**:
```
  Oper.new(|students:string|, 6)
```
  
  
**Create new array with [size] positions**:
- Assigning string
```
  Oper.set(|@z|, |students:5|, "&Gabriel")
  Console.WriteLine(|@z|)
```

- Assigning variable (with or without $)
```
  Oper.set(|@z|, |identity:5|, |$user|)
  Console.WriteLine(|@z|)
  
  Oper.set(|@z|, |identity:5|, |user|)
  Console.WriteLine(|@z|)
```
  

**Get value from index in array**:  
 - *Oper.get(vector:index)*  
  
The data type should be the same at the variable and at the array.  
This code gets the value in index 0 from the array (students) and stores inside a variable (user)
```
  StdArray.new(|students:string|, {{ "Julia","Mike","Jean" }} )
    
  let( |$user:string|, Oper.get(|students:0|) )
```
  
  
  
**Slice elements in array from  (x) to (y)  - (Only available on GoLang implementation)**:  
The data type should be the same at the variable and at the array.  
This code gets the value in index 0 from the array (students) and stores inside a variable (user)  
  
*Oper.slice(array, x,y)*
- Array
```
  StdArray.new(|students:string|, {{ "Julia","Mike","Jean" }} )
``` 
- Slice from element 0 until 1
```
  let( |$user:string|, Oper.slice(|students|, 0,1) )
```

- Slice from element 0 until the end
```
  let( |$user:string|, Oper.slice(|students|, 0,nil) )
```

- Slice from the first element until 1
```
  let( |$user:string|, Oper.slice(|students|, nil,1) )

```
```

## Append elements at the last position in array:   
*StdArray.new(array:\<type\>, {{ elements }} )*  
*Oper.add(array, element)* 


- Array
```
  StdArray.new(|students:string|, {{ "Julia","Mike","Jean" }} )
```
- Adding a string
```
  Oper.add(|students|, "&Camila")
```

- Adding a variable
```
  Oper.add(|students|, |$variable|)
  Oper.add(|students|, |variable|)
```
  
- Adding a number (it's only going to work on an [int] array)
```
  Oper.add(|student|, 46)
```

- Adding a number (it's only going to work on a [float] array)
```
  Oper.add(|student|, 59.91)
```
- Adding a number (it's only going to work on a [double] array)
```
Oper.add(|student|, 59.91293925)
```
  
## String manipulation
 - Count string pattern in string - *(<u>Only available on GoLang</u> implementation)*  
 *String.count_pattern(string, pattern)*   
  
```
    -- USING VARIABLE
    let (|$variable:string|, "&Hello world")
    String.count_pattern(|@z|, |$variable|, "&ll")
    Console.WriteLine(|@z|)
```
```
    -- USING STRING
    String.count_pattern(|@z|, "&Hello world", "&ll")
    Console.WriteLine(|@z|)
```


 - Get index of character in string
 *String.find(string, substring)*  
```
    --USING VARIABLE
    let (|$variable:string|, "&Hello.world")
    String.find(|@z|, |$variable|, "&l")
    Console.WriteLine(|@z|)
```
```
    --USING STRING
    String.find(|@z|, "&Hello world, "&l")
    Console.WriteLine(|@z|)
```

 - Slice string from (x) to (y)
 *String.slice(string, |begin:end| )*
```
    let (|$variable:string|, "&Hello world")
    String.slice(|@z|, |$variable|, |1:3|)
    Console.WriteLine(|@z|)

    String.slice(|@z|, "&Hello world", |1:3|)
    Console.WriteLine(|@z|)
```


 - Replace string from (x) for (y)
 *String.replace(string, x,y)*
```
    let (|$variable:string|, "&Hello world")
    String.replace(|@z|, |$variable|, "&Hello", "&Bye")
    Console.WriteLine(|@z|)
```

 - Split string from (x) to (y)
 *String.split(ret, split_var, split_character)*
```
    let (|$variable_one:string|, "&Hello-world")
    String.split(|@z|, |$variable_one|, "-")
    Console.WriteLine(|@z|)
```

 - String (s) to uppercase
 *String.uppercase(s)*
```
    let (|$a:string|, "&hello world")
    String.uppercase(|@z|, |$a|)
    Console.WriteLine(|@z|)


    String.uppercase(|@z|, "&hello world")
    Console.WriteLine(|@z|)
```

 - String (s) to lowercase
 *String.lowercase(s)*
```
    let (|$a:string|, "&HELLO WORLD")
    String.lowercase(|@z|, |$a|)
    Console.WriteLine(|@z|)


    String.lowercase(|@z|, "&HELLO WORLD")
    Console.WriteLine(|@z|)
```


 - String (s) to reverse order - *(<u>Only available on Kotlin/JVM</u> implementation)*
 *String.reverse(s)*
```
    let (|$a:string|, "&HELLO WORLD")
    String.reverse(|@z|, |$a|)
    Console.WriteLine(|@z|)


    String.reverse(|@z|, "&HELLO WORLD")
    Console.WriteLine(|@z|)
```


 - String (s) length/size
 *String.len(s)*
```
    let (|$a:string|, "&Hello world")
    String.len(|@z|,|$a|)
    Console.WriteLine(|@z|)


    String.len(|@z|, "&Hello world")
    Console.WriteLine(|@z|)
```


 - String (s) includes (x)?
 *String.includes(ret, s, x)*
```
    let (|$s:string|, "&hello world")
    let (|$x:string|, "&hello")

    String.includes(|@z|, |$s|, |$x|)
    Console.WriteLine(|@z|)

    let (|$s:string|, "&hello world")
    String.includes(|@z|, |$s|, "&hello")
    Console.WriteLine(|@z|)

    String.includes(|@z|, "&hello world", "&hello")
    Console.WriteLine(|@z|)
```

## TypeCasting values
1. From ? to *string*  
**Cast.toString(v)**
```
    let (|$variable|, 124)
    Cast.toString(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toString(|@casted|, 127.90)
    Console.WriteLine(|@casted|)
```
   


2. From ? to *boolean* 
**Cast.toBoolean(v)**
```
    let (|$variable|, |"true"|)
    Cast.toBoolean(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt16(|@casted|, |"true"|)
    Console.WriteLine(|@casted|)
```
   
3. From ? to *float* 
**Cast.toFloat(v)**
```
    let (|$variable|, 17)
    Cast.toFloat(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toFloat(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
4. From ? to *double* 
**Cast.toDouble(v)**
```
    let (|$variable|, 15)
    Cast.toDouble(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toDouble(|@casted|, 15)
    Console.WriteLine(|@casted|)
```
   
5. From ? to *int* 
**Cast.toInt(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt16(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toInt(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
6. From ? to *int8* 
**Cast.toInt8(v)**
```
    let (|$variable|, 1.23)
    Cast.toInt8(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toInt8(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
7. From ? to *int16* 
**Cast.toInt16(v)**
```
    let (|$variable|, 1.23)
    Cast.toInt16(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toInt16(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
8. From ? to *int32* 
**Cast.toInt32(v)**
```
    let (|$variable|, 1.23)
    Cast.toInt32(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toInt32(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
9. From ? to *int64* 
**Cast.toInt64(v)**
```
    let (|$variable|, 1.23)
    Cast.toInt64(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt64(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```
   
10. From ? to *uint* 
**Cast.toUInt(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt16(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```

11. From ? to *uint8* 
**Cast.toUInt8(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt8(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt8(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```

12. From ? to *uint16* 
**Cast.toUInt16(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt16(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt16(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```

13. From ? to *uint32* 
**Cast.toUInt32(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt32(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt32(|@casted|, 1.23)
    Console.WriteLine(|@casted|)
```

14. From ? to *uint64* 
**Cast.toUInt64(v)**
```
    let (|$variable|, 1.23)
    Cast.toUInt64(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toUInt64(|@casted|, |1456323.563|)
    Console.WriteLine(|@casted|)
    
```
  

15. From ? to *complex64* 
**Cast.toComplex64(v)**
```
    let (|$variable|, 1456323.563)
    Cast.toComplex64(|$variable|)
    Console.WriteLine(|@casted|)

    Cast.toComplex64(|@casted|, |1456323.563|)
    Console.WriteLine(|@casted|)
```
  
16. From ? to *complex128* 
**Cast.toComplex128(v)**
```
    let (|$variable|, 1456323.563)
    Cast.toComplex128(|@casted|, |$variable|)
    Console.WriteLine(|@casted|)

    Cast.toComplex128(|@casted|, |1456323.563|)
    Console.WriteLine(|@casted|)
```
  

Developed by Gabriel Margarido  
April 8th, 2022