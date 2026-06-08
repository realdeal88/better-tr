<div align="center">

# better

### Tek tuşla prompt mühendisliği.

**Yarım yamalak bir fikri, kesin ve kendini doğrulayan bir prompt'a dönüştüren bir Claude Code becerisi — anında.**
Beş turluk röportaj yok. Bir satır girersiniz, modelin ilk denemede çalıştırıp kendi başına *bitti*'ye götürebileceği bir prompt çıkar.

</div>

Yetenekli bir modelle çalışırken, prompt *arayüzün ta kendisidir*. Belirsiz bir prompt modeli tahmine zorlar — yanlış stack, yanlış kapsam, yalnızca mutlu yol — ve bu tahminin bedelini yeniden işle ödersiniz. İyi mühendislik edilmiş bir prompt doğru cevabı bariz kılar ve çalışmanın kendi işini denetlemesine izin verir.

`better` bu beceriyi bir refleks haline getirir: `/better <elinizde ne varsa>` yazarsınız ve size tam olarak **Anthropic'in kendi resmi dokümantasyonunun** söylediği şekilde kurulmuş bir prompt geri verir — spesifik, yapılandırılmış ve **doğrulanabilir bir başarı kriteri** taşıyan; böylece çalışma "makul görünüyor"da durmak yerine *bitti*'ye kadar döngüye girer.

Bütün mesele **hız**: bir slash komutuna uzandınız, o yüzden *şimdi* forge eder. Boşlukları çıkarımlar, varsayımlarını yüksek sesle belirtir ve sizi asla sorguya çekmez. Ham fikir → güçlü prompt, tek seferde.

<div align="center">

[Kurulum](#kurulum) · [Kullanım](#kullanım) · [Bir prompt'un anatomisi](#forge-edilmiş-bir-promptun-anatomisi) · [Neden güvenmeli](#neden-güvenmeli--köken)

`MIT` · Claude Code eklentisi + becerisi · Anthropic'in kendi prompt mühendisliği dokümanlarından damıtıldı

</div>

---

## Fark

Acelesi olan bir geliştiricinin yazdığı aynı sekiz kelime:

**Ham girdi:** `add password reset to my app`

`better` olmadan model tahmin eder: hangi stack? E-posta mı, SMS kodu mu? Token süresi? Rate limit? — ve genelde yarısını yanlış yapar.

`better` ile aynı fikir şuna dönüşür:

```
Uygulamaya bir "şifre sıfırlama" akışı kur (Next.js + Supabase Auth, @lib/auth.ts ile uyumlu).

İş: 30 dakikada dolan, imzalı tek kullanımlık bir token üretip e-postalayan bir istek
endpoint'i; token'ı doğrulayıp şifreyi güncelleyen bir doğrulama endpoint'i.
Kısıtlar: token'ları yalnızca hash'lenmiş sakla; istek endpoint'ine rate limit koy;
var olmayan bir adres için bile e-posta gönderildiğini ima etme (kullanıcı varlığını sızdırma).

Başarı: süresi dolmuş token, kullanılmış token ve var olmayan e-posta için test yazıp
yeşile çevirirsin; akış bir test hesabında uçtan uca çalışır. `bun test` ve typecheck
yeşil olmadan bitti deme.
```

Fark, tahmin etmek ile çalıştırmak arasındaki farktır.

---

## Kurulum

### Eklenti olarak (önerilen)

```bash
# Claude Code içinde:
/plugin marketplace add realdeal88/better-tr
/plugin install better@better-tr
```

### Bağımsız beceri olarak

```bash
git clone https://github.com/realdeal88/better-tr
cp -r better-tr/skills/better ~/.claude/skills/better
```

> Eklenti olarak kurulduğunda komut `/better:better`; bağımsız beceri olarak yalnızca `/better`.

---

## Kullanım

```bash
/better bülten CSV'mden yinelenen satırları silen bir script
/better fast <fikir>     # soru sorma, sadece varsay ve forge et
/better run  <fikir>     # forge et ve hemen çalıştır
```

`better` anında forge eder. Yalnızca eksik bir ayrıntı çıktıyı gerçekten değiştirecek ve makul bir varsayım yapılamayacaksa **bir kez** sorar — tıklanabilir seçeneklerle — ve sonra forge eder.

---

## Forge edilmiş bir prompt'un anatomisi

Güçlü bir prompt, işin ihtiyacı kadar şu parçaları alır:

- **Hedef** — en üstte tek cümlelik niyet.
- **Bağlam** — yürütücünün çıkaramayacağı şey: stack, hedef kitle, kısıtlar.
- **İş** — somut, ölçülebilir gereksinimler (sıfatlar değil).
- **Başarı kriteri** — *en önemli satır.* İşin yürüdüğünü, çalışmanın kendisinin denetleyebileceği şekilde nasıl anlarız.
- **Doğrulama** — kriteri kanıtlayan mekanizma (testleri çalıştır, sayfayı aç...).
- **Kısıtlar / hedef olmayanlar** — kapsamın kenarları ve *yapılmaması* gereken.

Tam ayrıntılar, türe özgü iskeletler (kurma, hata düzeltme, refactor, yazma, araştırma, görsel, agent) ve örnek kütüphanesi: [`skills/better/references/forge-anatomy.md`](skills/better/references/forge-anatomy.md).

---

## Neden güvenmeli — köken

`better`'ın kuralları kişisel görüş değildir. Bunlar **Anthropic'in prompt mühendisliği üzerine yayımlanmış kendi dokümantasyonundan** çıkarılmıştır — prosedür yerine kriter, öğüt yerine mekanizma, belirsiz yerine spesifik ve yüksek akıl yürüten bir modele planlama alanı vermek. Her kuralın kaynağına tam eşlemesi: [`docs/METHODOLOGY.md`](docs/METHODOLOGY.md).

---

## Lisans

[MIT](LICENSE) © realdeal88
