# hubot-kurashinohinto

暮らしのヒント集をつぶやくhubot script

See [`src/kurashinohinto.coffee`](src/kurashinohinto.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-kurashinohinto --save`

Then add **hubot-kurashinohinto** to your `external-scripts.json`:

```json
[
  "hubot-kurashinohinto"
]
```

## Sample Interaction

```
user1> hubot hint
hubot> 12月16日 (火) の暮らしのヒントです。
“新聞を読み終えたら、元にあった状態よりもきれいに畳んでおきましょう。次に読む人が気持ちよく読むことができます。そんな行いは気持ちを整える手伝いをしてくれます。”
```
