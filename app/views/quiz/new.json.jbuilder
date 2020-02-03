json.array! @questions do |question|
  json.question question.question
  json.answers question.answer do |answer|
    json.answer answer.answer
    json.is_correct answer.is_correct
  end
end