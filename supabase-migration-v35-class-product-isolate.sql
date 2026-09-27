-- Isolasi kelas/peserta per produk (CBT vs QuizIT)
alter table cbt_classes add column if not exists product_id text default null;
create index if not exists idx_cbt_classes_product on cbt_classes(product_id);

-- Opsional: tandai kelas yang jelas milik QuizIT (sesuaikan jika perlu)
-- update cbt_classes set product_id = 'quizit' where product_id is null and institution ilike '%2024%';

-- Kelas legacy tanpa product_id dianggap CBT (tampil di CBT, tidak di QuizIT jika QuizIT hanya baca product_id=quizit)
-- Jika ada kelas QuizIT yang masih null, set manual:
-- update cbt_classes set product_id = 'quizit' where id in (...);

-- Paket
alter table cbt_packs add column if not exists product_id text default null;
update cbt_packs set product_id = 'quizit' where id like 'quizit-%' and (product_id is null or product_id = '');
update cbt_packs set product_id = 'cbt' where id not like 'quizit-%' and (product_id is null or product_id = '');
