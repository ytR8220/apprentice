# ステップ 3

## 1.よく見られているエピソードを知りたいです。エピソード視聴数トップ 3 のエピソードタイトルと視聴数を取得してください

```sql
SELECT episode_name, views_count FROM episode AS ep INNER JOIN program_table AS pt ON ep.episode_id = pt.episode_id ORDER BY views_count DESC LIMIT 3;
```

## 2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ 3 の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

```sql
SELECT program_name, seASon_name, episode_number, episode_name, views_count FROM program AS p INNER JOIN episode AS ep ON p.program_id = ep.program_id INNER JOIN seASon AS s ON ep.seASon_id = s.seASon_id INNER JOIN program_table AS pt ON ep.episode_id = pt.episode_id ORDER BY views_count DESC LIMIT 3;
```

## 3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします

```sql
SELECT channel_name, start_time, end_time, seASon_name, episode_number, episode_name, episode_description FROM episode AS ep INNER JOIN program_table AS pt ON ep.episode_id
= pt.episode_id INNER JOIN channel AS ch ON pt.channel_id = ch.channel_id INNER JOIN seASon AS s ON ep.seASon_id = s.seASon_id WHERE DATE(start_time) = '2023-05-16';
```

## 4.ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

```sql
SELECT start_time, end_time, seASon_name, episode_number, episode_name, episode_description FROM program_table AS pt INNER JOIN episode AS ep ON pt.episode_id = ep.episode_id INNER JOIN seASon AS s ON ep.seASon_id = s.seASon_id INNER JOIN channel AS ch ON pt.channel_id = ch.channel_id WHERE channel_name = 'チャンネル1' AND DATE(start_time) >= curdate() AND DATE(start_time) < CURDATE() + INTERVAL 1 WEEK;
```

## 5.直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ 2 の番組に対して、番組タイトル、視聴数を取得してください

```sql
SELECT program_name, sum(views_count) FROM program_table AS pt INNER JOIN episode AS ep ON pt.episode_id = ep.episode_id INNER JOIN program AS p ON ep.program_id = p.program_id WHERE DATE(start_time) BETWEEN CURDATE() - INTERVAL 1 WEEK AND CURDATE() GROUP BY program_name ORDER BY sum(views_count) DESC LIMIT 2;
```

## 6.ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

```sql
SELECT genre_Name, program_Name, avg_Views FROM (SELECT Genre_Name, Program_Name, Avg_Views, RANK() OVER (PARTITION BY Genre_Name ORDER BY Avg_Views DESC) as ranking FROM (SELECT g.Genre_Name, p.Program_Name, AVG(pt.Views_Count) AS Avg_Views FROM Program p INNER JOIN Episode e ON p.Program_ID = e.Program_ID INNER JOIN Program_table pt ON e.Episode_ID = pt.Episode_ID INNER JOIN Genre g ON p.Genre_ID = g.Genre_ID GROUP BY p.Program_ID, g.Genre_Name, p.Program_Name) AS SubQuery) AS T WHERE ranking = 1;
```
