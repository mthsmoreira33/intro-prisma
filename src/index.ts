import express, { Request, Response } from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

const app = express()
const port = 3333

app.use(express.json())
app.use(cors())

const repository = new PrismaClient()

app.get('/users', async (request: Request, response: Response) => {
    try {
        const users = await repository.user.findMany()

        return response.status(200).json({
            success: true,
            code: response.statusCode,
            message: "Usuários listados com sucesso",
            data: users
        })
    } catch (error) {
        return response.status(500).json({
            success: false,
            code: response.statusCode,
            message: "Erro ao listar usuário"
        })
    }
})


app.post('/users', async (request: Request, response: Response) => {
  try {
    const {name, lastName, email, bio, isActive} = request.body

    if (!name || !lastName || !email) {
        return response.status(400).json({
            success: false,
            code: response.statusCode,
            message: "Preenche os campos obrigatórios"
        })
    }

    const createdUser = await repository.user.create({
        data: {
            name,
            lastName,
            email,
            bio,
            isActive
        }
    })

    return response.status(201).json({
        success: true,
        code: response.status,
        message: "Usuário cadastrado com sucesso",
        data: createdUser
    })

  } catch (error) {
    return response.status(500).json({
      success: false,
      code: response.statusCode,
      message: "Erro ao criar usuário",
    });
  }
})

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`)
})
