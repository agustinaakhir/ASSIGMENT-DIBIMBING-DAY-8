# ASSIGMENT-DIBIMBING-DAY-8
## Mencari Missing Value Pada Data
### Data yang mengandung missing valu lebih dari 60% dihilangkan
    Data yang dihilangkan adalah pada kolom FireplaceQu, PoolQC, Fence, MiscFeature, GarageQual, GarageCond, dan LotFrontAge. Data yang dihilangkan adalah fasilitas yang ada pada setiap ruangan di hotel. 
### Menemukan kolom yang masih mengandung missing value dan menggisinya dengan 0, other, mean, atau modus. Tergantung data yang ada.
    Kolom yang mengandung missing value dan diganti dengan "other" adalah BsmtQual, BsmtCond, BsmtExposure, BsmtFinType1, BsmtFinType2, GarageType, GarageYrBlt, GarageFinish. Di isi dengan "other" dikarenakan fasilitas yang ada memiliki berbagai macam jenis dan berisi karakter. Jika, fasilitas kosong bisa di isi dengan fasilitas yang tersedia hotel secara random.
    Kolom yang mengandung missing value dan diganti dengan "modus" adalah MasVnrType. Di isi dengan "modus" dikarenakan fasilitas yang kosong bisa tidak perlu di isi atau none dikarenakan tipe yang disediakan terbatas.
## Mengubah variabel kategorikal menjadi numerikal menggunakan "One-Hot-Encoding"
    Variabel yang diubah adalah pada kolom SalePrice.
## Melakukan Outlier Handling
    Variabel yang memiliki paling banyak outlier adalah SalePrice pada data train di angka empat ratus ribu sampai tujuh ratus ribu. Harga yang diluar rata-rata harga rrom dan fasilitas hotel.
    Teknik menggunakan IQR untuk menentukan outlier melalui suatu nilai batas. Batas Bawah Q1-1.5 dan batas atas Q3+1.5. 
    Mean pada SalePrice diketahui 180921,195890411.
    Lower bond diketahui 25216,7513982338
    Uper bond diketahui 340038
    Dari variance yang bisa dilihat, data yang tersebar tidak terlalu jauh dari rata-rata.
    Dari data transformasi yang dilihat SalePrice pada histogram juga tidak terlalu tersebar jauh.
    
    



    
