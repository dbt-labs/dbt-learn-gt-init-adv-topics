# dbt Style Guide

## Language requirements
- Every column description should be in German

## SQL style guide
These SQL style choices should be asserted with a .sqlfluff configuration file and linting in CI jobs.
- **DO NOT OPTIMIZE FOR FEWER LINES OF CODE.**  

  New lines are cheap, brain time is expensive; new lines should be used within reason to produce code that is easily read.

- Use trailing commas
- Indents should use four spaces. 

## Model Layers
- Only models in `staging` should select from [sources](https://docs.getdbt.com/docs/building-a-dbt-project/using-sources)
- Models not within the `silver/staging` folder should select from [refs](https://docs.getdbt.com/reference/dbt-jinja-functions/ref).
- The following are the DAG stages that we will use:
  <details>

  <summary>Common</summary>

    | file_prefix / dag_stage | Typically found in | description                                                        |
    |-----------|--------------------|--------------------------------------------------------------------|
    | seed_     | /seeds             | <li> Indicates a data set created from `dbt seed`. |
    | stg_      | /models/silver/staging    | <li> Indicates a data set that is being cleaned and standardized. </li><li> In absence of a base_ layer, it represents the 1:1 relationship between the bronze source and first layer of models. </li> |                                                                                                           |
    | int_      | /models/silver/intermediate      | <li> Indicates a logical step towards creating a final / gold data set. </li><li>Typically used for:</li><ul><li>Breaking up a very large fct_ or dim_ model into smaller pieces to reduce complexity</li><li>Creating a reusable data set to reference in multiple downstream fct_ and dim_ models</li></ul> |
    | dim_      | /models/gold      | <li> Flags data which is used to describe an entity. </li><li> Indicates a final data which is robust, versatile, and ready for consumption. </li> |
    | fct_      | /models/gold      | <li> Flags data which is in the form of numeric facts observed during measurement events. </li><li> Indicates a final data which is robust, versatile, and ready for consumption. </li> |

  </details>

