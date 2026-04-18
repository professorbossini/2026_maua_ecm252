require('dotenv').config()
const express = require('express')
const mysql2 = require('mysql2/promise')
const app = express()
//middleware
app.use(express.json())

let conexao

const conectar = async () => {
  try{
    conexao = await mysql2.createConnection({
      host: process.env.HOST,
      user: process.env.USUARIO,
      password: process.env.PASSWORD,
      database: process.env.DATABASE,
      port: process.env.PORT
    })
    console.log('Conectado ao MySQL')
  }
  catch(erro){
    console.log(`Erro ao conectar com o banco: ${erro}`)
  }
}
conectar()

//fazer uma rota para cadastrar uma tarefa
//suponha que o cliente vai enviar titulo e descrição por meio da requisição
//dica: use req.body
app.post('/tarefas', async function(req, res){
  try {
    const { titulo, descricao } = req.body 
    const [resultado] = await conexao.query(
      `INSERT INTO tb_tarefa (titulo, descricao) VALUES (?, ?)`,
      [titulo, descricao]
    )
    res.status(201).json({
      titulo: titulo,
      descricao: descricao,
      cod_tarefa: resultado.insertId
    })   
  } 
  catch (erro) {
    console.log(erro)
    res.status(500).json({
      erro: 'Erro ao buscar as tarefas'
    })
  }
})

//fazer o put, ele atualiza um lembrete
///tarefas/12345
app.put('/tarefas/:id', async (req,  res) => {
  try {
    const { id } = req.params
    const { titulo, descricao } = req.body
    const sql = 'UPDATE tb_tarefa SET titulo = ?, descricao = ? WHERE cod_tarefa = ?'; 
    await conexao.query(
      sql,
      [titulo, descricao, id]
    )
    res.json({id, titulo, descricao})
  }
  catch (error) {
    console.log('Atualizando: ' + erro)
    res.status(500).json({erro: 'Erro ao atualizar a tarefa'})
  }
})

//fazer a rota para remover
app.delete('/tarefas/:id', async (req, res) => {
  try {
    const { id } = req.params
    await conexao.query(
      'DELETE FROM tb_tarefa WHERE cod_tarefa = ?',
      [id]
    )
    res.json({
      mensagem: 'Tarefa excluída'
    })  
  } 
  catch (error) {
    console.log(error)
    res.status(500).json({
      erro: 'Erro ao excluir a tarefa'
    })
  }
})

//obter a lista de tarefas (select)
app.get('/tarefas', async (req, res) => {
  try{
    const [linhas] = await conexao.query('SELECT * FROM tb_tarefa')
    res.json(linhas)
  }
  catch(erro){
    console.log(erro)
    res.status(500).json({
      erro: 'Erro ao buscar as tarefas'
    })
  }
})

app.get('/', (req, res) => {
  res.json({
    mensagem: 'Servidor funcionando!!'
  })
})

const port = 3000
app.listen(port, () => {
  console.log( `Servidor executando na porta ${port}.`)
})