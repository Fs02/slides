## Dasar Pemograman Golang
---

### Halo 🇮🇩!

```javascript
package main

import (
	"fmt"
)

func main() {
	fmt.Println("Halo 🇮🇩!")
	// Output: Halo 🇮🇩!
}
```

- Setiap project golang minimal harus memiliki satu `package main` dengan sebuang fungsi `main()` didalamnya.
- Jalankan menggunakan command `go run <file>.go`
- Compile menggunakan command `go build <file>.go`

---

### Deklarasi Variabel

```javascript
package main

var a int

// atau sekaligus
var (
	b float64
	c string
	d bool
	e *bool
)

func main() {
}
```

- Variabel dapat dideklarasikan menggunakan keyword `var`.
- Jika tidak ada nilai yang diberikan, variabel di golang akan selalu memiliki nilai kosong untuk tipe tersebut.

---

### Deklarasi Variabel dengan Nilai

```javascript
package main

import (
	"fmt"
)

var (
	a int     = 10
	b float64 = 10.5
	c string  = "golang"
	d bool    = true
	e *bool   = &d // pointer ke b
)

func main() {
	var bendera string = "🇮🇩"
	fmt.Printf("Halo %s", bendera)
	// Output: Halo 🇮🇩
}
```

- Variabel dapat dideklarasikan dengan memberikan nilai tertentu.

---

### Deklarasi Variabel Alternatif

```javascript
package main

import (
	"fmt"
)

func main() {
	// menggunakan var
	var bendera = "🇮🇩"
	fmt.Println("Halo", bendera)
	// Output: Halo 🇮🇩


	// menggunakan :=
	a := 10
	b := 10.5
	c := "golang"
	d := true
	e := &d

	fmt.Println(a, b, c, d, e)
	// Output: 10 10.5 golang true 0x40e020
}
```

- Golang dapat mendeteksi tipe data saat program di `compile`, sehingga tipe data pada umumnya tidak perlu ditulis.
- Variabel juga dapat dideklarasikan tanpa menggunakan keyword `var`, akan tetapi menggunakan operator `:=`.

---

### Konstanta

```javascript
package main

import (
	"fmt"
)

const (
	a = 10
	b = 10.5
	c = "golang"
	d = true
)

func main() {
	fmt.Println(a, b, c, d)
	// Output: 10 10.5 golang true
}
```

- `Constant` dapat dideklarasi menggunakan keyword `const`.
- Nilai yang dapat dijadikan `constant` hanyalah nilai yang dapat diketahui saat compile-time.
- Pointer dan hasil eksekusi fungsi, tidak dapat dijadikan `constant`.

---

### Array

```javascript
package main

import (
	"fmt"
)

func main() {
	a := [5]string{"a", "b", "c", "d", "e"}
	fmt.Println(a)
	// Output: [a b c d e]

	fmt.Println(len(a))
	// Output: 5
	
	fmt.Println(a[0])
	// Output: a
}
```

- Array di golang memiliki kapasitas yang ditentukan disaat deklarasi.
- Besar kapasitas array di golang tidak dapat diubah saat program berjalan.

---

### Slice

```javascript
package main

import (
	"fmt"
)

func main() {
	a := []string{"a", "b", "c", "d", "e"}
	fmt.Println(a)
	// Output: [a b c d e]

	a = append(a, "f", "g")
	fmt.Println(a)
	// Output: [a b c d e f g]

	// hapus element pertama dan terakhir (slicing).
	a = a[1:6]
	fmt.Println(a)
	// Output: [b c d e f]

	// slices juga dapat dibuat menggunakan fungsi make
	b := make([]string, 3, 5)
	fmt.Printf("length: %v, capacity:%v\n", len(b), cap(b))
	// Output:
}
```

- Slice memiliki kapasitas yang dinamis.
- Elemen didalam slice dapat diubah, ditambah maupun dihapus saat program berjalan.

---

### Map

```javascript
package main

import (
	"fmt"
)

func main() {
	bulan := map[string]int{
		"januari":  1,
		"februari": 2,
	}

	// tambah atau ubah nilai elemen
	bulan["maret"] = 3

	// hapus elemen
	delete(bulan, "maret")

	fmt.Println("januari adalah bulan ke-", bulan["januari"])
	// Output: januari adalah bulan ke- 1
}
```

- Map juga dapat dibuat menggunakan fungsi make: `make(map[<type key>]<type value>)`, contoh: `make(map[string]int)`.

---

### Percabangan

```javascript
package main

import (
	"fmt"
)

func main() {
	nilai := 9

	if nilai < 5 {
		fmt.Println("yeay!, kamu tidak lulus")		
	} else if nilai < 7 {
		fmt.Println("yeay!, kamu hampir tidak lulus")
	} else {
		fmt.Println("yeay!, kamu lulus")
	}
	// Output: yeay!, kamu lulus
}
```

- Kondisi tidak perlu menggunakan tanda kurung.
- Setiap aksi dari kondisi wajib menggunakan kurung kurawal.

---

### Perulangan

```javascript
package main

import (
	"fmt"
)

func main() {
	a := []string{"a", "b", "c", "d"}

	// menggunakan index tanpa range
	for i := 0; i < len(a); i++ {
		fmt.Print(a[i])
	}
	fmt.Println()
	// Output: abcd

	// while loop
	i := 0
	for i < 5 {
		i++
	}

	// infinity loop
	for {
		break // keluar loop
	}
}
```

- Loop digolang dideklarasikan tanpa menggugunakan tanda kurung.

---

### Perulangan dengan Range

```javascript
package main

import (
	"fmt"
)

func main() {
	a := []string{"a", "b", "c", "d"}

	// menggunakan range
	for _, v := range a {
		fmt.Print(v)
	}
	fmt.Println()
	// Output: abcd

	// menggunakan index
	for i := range a {
		fmt.Print(a[i])
	}
	fmt.Println()
	// Output: abcd
}
```

---

### Fungsi

```javascript
package main

import (
	"fmt"
)

func tambah(a int,b int) int {
   result := a * b
   return result
}

func main() {
	result := tambah(2, 3)
	fmt.Println(result)
	// Output: 5
}
```

---

### Struct

```javascript
type City struct {
	Name       string
	Population int
}

// Gunakan pointer receiver, untuk mengubah isi struct
func (c *City) SetPopulation(population int) {
	c.Population = population
}

func (c City) String() string {
	return "Name: " + c.Name + ", Populasi: " + strconv.Itoa(c.Population)
}

func main() {
	// deklarasi
	bandung := City{Name: "Bandung", Population: 1000}

	fmt.Println(bandung.String())
	// Output: Name: Bandung, Populasi: 1000

	bandung.SetPopulation(1500)
	fmt.Println(bandung)
	// Output: Name: Bandung, Populasi: 1000
}
```

- Tidak ada class di golang, hanya ada struct.

---

### Interface

```javascript
type Animal interface {
	Sound() string
}

type Cat struct{}

func (c Cat) Sound() string { return "meow" }

type Dog struct{}

func (d Dog) Sound() string { return "guk" }

func call(animal Animal) {
	fmt.Println(animal.Sound())
}

func main() {
	call(Cat{})
	// Output: meow

	call(Dog{})
	// Output: guk
}

```
