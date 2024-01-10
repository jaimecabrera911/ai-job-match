import { Injectable } from '@nestjs/common';
import { GoogleGenerativeAI } from '@google/generative-ai';
import * as process from 'process';

@Injectable()
export class AiService {
  private genAI = new GoogleGenerativeAI(process.env.API_KEY_AI || 'api-key');

  async getIAGeneratedResponse(prompt: string) {
    const model = this.genAI.getGenerativeModel({ model: 'gemini-pro' });
    const result = await model.generateContent(prompt);
    const response = await result.response;
    return response.text();
  }
}
