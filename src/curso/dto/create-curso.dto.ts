import { IsNotEmpty, Length  } from "@nestjs/class-validator";

export class CreateCursoDto {

    @IsNotEmpty()
    @Length(1,255)
    nome: string;

    @IsNotEmpty()
    @Length(1,255)
    universidade_id: number;

}       

