# ステップ 3

## 1.よく見られているエピソードを知りたいです。エピソード視聴数トップ 3 のエピソードタイトルと視聴数を取得してください

```sql
select episode_name, views_count from episode as ep inner join program_table as pt on ep.episode_id = pt.episode_id order by views_count desc limit 3;
```

## 2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ 3 の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

```sql
select program_name, season_name, episode_number, episode_name, views_count from program as p inner join episode as ep on p.program_id = ep.program_id inner join season as s on ep.season_id = s.season_id inner join program_table as pt on ep.episode_id = pt.episode_id order by views_count desc limit 3;
```

## 3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします

```sql
select channel_name, start_time, end_time, season_name, episode_number, episode_name, episode_description from episode as ep inner join program_table as pt on ep.episode_id
= pt.episode_id inner join channel as ch on pt.channel_id = ch.channel_id inner join season as s on ep.season_id = s.season_id where date(start_time) = '2023-05-16';
```

## 4.ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

```sql
select start_time, end_time, season_name, episode_number, episode_name, episode_description from program_table as pt inner join episode as ep on pt.episode_id = ep.episode_id inner join season as s on ep.season_id = s.season_id inner join channel as ch on pt.channel_id = ch.channel_id where channel_name = 'チャンネル1' and date(start_time) >= curdate() and date(start_time) < CURDATE() + INTERVAL 1 WEEK;
```

## 5.直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ 2 の番組に対して、番組タイトル、視聴数を取得してください

```sql
SELECT title, count FROM
```

## 6.ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

```sql
SELECT genre_name, title, AVG(count) FROM
```
