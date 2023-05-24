
// クラスを自作し使うことが出来る
class Playlist {
  constructor(musicList) {
    this.musicList = musicList;
  }

  addSong(song) {
    this.musicList.push(song);
  }

  removeSong(song) {
    this.musicList = this.musicList.filter((item) => item !== song);
  }

  play() {
    return `再生中: ${this.musicList[0]}`;
  }
}

let myPlaylist = new Playlist([]);
myPlaylist.addSong('Lemon');
myPlaylist.addSong('花束');
console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong('Lemon');
console.log(myPlaylist.play()); // 再生中：花束