document.addEventListener('DOMContentLoaded', () => {

    const jsSeacrchForm = document.getElementById('search-form')
    const jsConversion = document.querySelector("#conversion")
    jsSeacrchForm.addEventListener('input', async () => {
        const inputValue = jsSeacrchForm.value;
      
        // 予測変換の結果を取得する非同期処理（例としてダミーデータを使用）
        const predictions = await fetchPredictions(inputValue);
      
        // 予測変換の結果を HTML に変換して表示する
        const html = predictions.map(board => {
            return `<li><a href="/boards/${board.id}">${board.title}</a></li>`;
        }).reduce((a, b) => {
            return a + b
          })  
      
        jsConversion.innerHTML = html;
      });
      
      async function fetchPredictions(inputValue) {
        // 予測変換の結果を取得する非同期処理を実装する
        const response = await fetch('/boards.json');
        const data = await response.json();
      
        // 入力文字列と部分一致する board をフィルタリングする
        const matchedBoard = data.filter(board => board.title.includes(inputValue) && board.tag_name !== inputValue).slice(0, 3);
        console.log(data)
      
        return matchedBoard;
      }
});

