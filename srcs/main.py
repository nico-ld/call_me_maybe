from llm_sdk.llm_sdk import Small_LLM_Model


def generate(model: Small_LLM_Model, prompt: str, max_new_tokens: int = 40) -> str:
        ids: list[int] = model.encode(prompt)[0].tolist()
        start = len(ids)
        for _ in range (max_new_tokens):
            logits = model.get_logits_from_input_ids(ids)
            next_id = max(range(len(logits)), key=lambda i : logits[i])
            ids.append(next_id)
        return (model.decode(ids[start:]))

if (__name__ == "__main__"):
    print("\033[2J\033[1;1HLoading Qwen...")
    model = Small_LLM_Model()

    # Clear screen
    print("\033[1;1H", end="")
    for line in range(30):
        print("\033[0K\033[1B", end="", flush=True)
    print("\033[1;1H", end="", flush=True)

    # Prompt loop
    while (True):
        prompt = input("User >> ")
        if (prompt == "EXIT"):
            break
        print("\033[sQwen is thinking..", end="", flush=True)
        print("\033[u\033[0KQwen >> ", end="")
        print(generate(model, (
            f"<|im_start|>user\n{prompt}<|im_end|>\n"
            "<|im_start|>assistant\n<think\n\n</think>"
        ), 100))
