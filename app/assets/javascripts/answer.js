document.addEventListener('DOMContentLoaded', () => {
    console.log("DOMed")
    const answer_btn = document.getElementById('answer_btn');
    const questionId = document.getElementById('question_id').value;
    const choiceId = document.getElementById('choice_id').value;
    console.log(questionId);
    console.log(answer_btn);
    console.log(choiceId);

   answer_btn.addEventListener('click',async () => {
    const choices = Array.from(document.querySelectorAll('.form-check-input:checked')).map(element => element.value);
    try {
        const response = await fetch('/answers?choice_id=1&question_id=1', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            answer: {
              choices: choices,
              question_id: questionId ,
              choice_id: choiceId
            }
          })
          
        });
        alert('通ってる？')
        // レスポンスの処理
        const data = await response.json();
        console.log(data);
        
        // 必要な後続の処理を記述する
      } catch (error) {
        // エラーハンドリング
        console.error(error);
      }
    })
});
