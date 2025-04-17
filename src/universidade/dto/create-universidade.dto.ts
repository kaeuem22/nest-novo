import { IsNotEmpty, Length  } from "@nestjs/class-validator";

export class CreateUniversidadeDto {

    @IsNotEmpty()
    @Length(1,255)
    razao: string;

    @IsNotEmpty()
    @Length(1,255)
    fantasia: string;

    @IsNotEmpty()
    @Length(1,255)
    endereco_id: number;
}

