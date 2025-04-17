import { IsNotEmpty, Length  } from "@nestjs/class-validator";
export class CreateEnderecoDto {
    @IsNotEmpty()
    @Length(1,255)
    nome: string;


    @IsNotEmpty()
    @Length(1,255)
    rua: string;

    @IsNotEmpty()
    @Length(1,255)
    numero: string;
    
}

