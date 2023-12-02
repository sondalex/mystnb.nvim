---
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Heading

## Example


```{code-cell} python 
import pandas as pd

df = pd.DataFrame(
    {
        "a": [0, 1, 2, 3, 4, 6, 7],
        "b": ["a", "b", "c", "d", "e", "f", "g", "h", "i"],
        "c": ["a", "b", "c", "d", "e", "f", "g", "h", "i"],
    }
)
```

```{code-cell} r
library(dplyr)
data <- data(AirPassengers)
data %>% ggplot2::ggplot(
  data,
  aes(x = n, y = t)
)
```


```{code-cell} c
int main(){
    int x = 0;
}
```

```{code-cell} jl 
using DataFrame
DataFrame(
    "product identifier" => [15, 20, 25],
    "product name" => ["Apple", "Pear", "Peach"]
)
```

