#Private LLM with Langchain
chatbot built with Chainlit. 

### Chat with your documents 🚀
- [Huggingface model](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGML/blob/main/llama-2-7b-chat.ggmlv3.q8_0.bin) as Large Language model
- [LangChain](https://python.langchain.com/docs/get_started/introduction.html) as a Framework for LLM
- [Chainlit](https://docs.chainlit.io/overview) for deploying.

## System Requirements

You must have Python 3.9 or later installed. Earlier versions of python may not compile.  

---

## Steps to Replicate 

1. Clone the repo locally.
   ```
   cd langchain-llama
   ```

2. Rename example.env to .env with `cp example.env .env`and input the HuggingfaceHub API token as follows. Get HuggingfaceHub API key from this [URL](https://huggingface.co/settings/tokens). You need to create an account in Huggingface webiste if you haven't already.
   ```
   HUGGINGFACEHUB_API_TOKEN=your_huggingface_api_token
   ```
   
3. Create a virtualenv with conda and activate it. First make sure that you have conda installed. Then run the following command.
   ```
   conda create -n .venv python=3.11 -y && source activate .venv
   ```

4. Run the following command in the terminal to install necessary python packages:
   ```
   pip install -r requirements.txt
   ```
   Then install llama-cpp-python to work with your GPU and not CPU.
   ```
   CMAKE_ARGS="-DLLAMA_METAL=on" FORCE_CMAKE=1 pip install --upgrade --force-reinstall llama-cpp-python --no-cache-dir
   ```

5. Run the following command in your terminal to create the embeddings and store it locally:
   ```
   python3 ingest.py
   ```

6. Download the LLM model from HuggingFace using this script:
   ```
   chmod +x download_model.sh
   ./download_model.sh
   ```
   ####If you decide to use different model:
   you can edit the model inside the script `download_model.sh` to any model you like from the Huggingface repo.
   just make sure to change model_path and name in the code here accordingly:
     ```
      llm = LlamaCpp(
        model_path="./model/openorca-platypus2-13b.Q4_K_M.gguf",
        n_gpu_layers=n_gpu_layers,
        n_batch=n_batch,
        callback_manager=callback_manager,
        verbose=True,
        n_ctx=2048# Verbose is required to pass to the callback manager
    )
   ```
7. Run the following command in your terminal to run the app UI:
   ```
   chainlit run main.py -w
   ```
