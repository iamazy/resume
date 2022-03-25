module Resume (resume) where

import Data.List
import TeX

basicInfo :: Resume
basicInfo = paragraph
  [ pure "\\basicInfo{"
  , pure $ "\\email{iamazy.me@outlook.com}" ++ period
  , cn $ "\\phone{(+86) 156-6547-5750}" ++ period
  , pure $ "\\github[iamazy]{https://github.com/iamazy}" ++ period
  , pure $ "\\homepage[iamazy.github.io]{https://iamazy.github.io}" ++ period
  , pure "}"
  ] where period = "\\textperiodcentered\\"

education :: Resume
education = section "教育经历" "Education"
  [ datedSection (date "2014" "09" ~~ date "2018" "06") $ paragraph
    [ cn "\\textbf{东北石油大学}" ]
  , cn $ "专业：软件工程（本科）"
  ]

zky :: Resume
zky = paragraph
  [ datedSection (date "2018" "06" ~~ date "2020" "02") $ paragraph
    [ cn "\\textbf{中国科学院信息工程研究所}"
    ]
  , paragraph
    [ cn "\\role{数据检索，可视化}{数据鉴权，后端开发工程师}"
    ]
  , noSimple $ itemize
    [ cn "\\item 负责设计实现海量数据检索平台，包括查询，排序，聚类，搜索推荐，统一查询接口等"

    , cn "\\item 负责设计实现基于 Spring Security 的统一鉴权访问控制系统"

    , cn "\\item 负责设计实现网络数据流实时获取组件，支持 jpeg，mjpeg，h.264，hls 等格式"

    , cn "\\item 负责设计实现 rtsp 代理组件，支持黑白名单和流量控制，对外不再暴露 rtsp 真实地址和用户名密码"
    ]
  ]

jd :: Resume
jd = paragraph
  [ datedSection (date "2020" "03" ~~ present) $ paragraph
    [ cn "\\textbf{京东零售集团 - 技术与数据中心 - 存储研发部}, 后端开发工程师（T5）"
    ]
  , paragraph
    [ cn "\\role{分布式存储系统}{消息队列}"
    ]
  , itemize
    [ cn $ "\\item 深入理解 JMQ 的实现原理，包括消息持久化机制，生产/消费模型，消息路由策略，一致性保证等"
    
    , cn $ "\\item 修复 " ++ joyqueue ++" Broker 端的 bug，如解决 Kafka 协议消费时限流导致长尾问题"

    , cn "\\item 负责 JMQ 单元化相关工作，独立设计实现 JMQ-DRC 异地数据传输模块，接入 k8s 实现任务的资源账单功能"

    , cn "\\item 参与 JMQ2 迁移 JMQ4 的工作，负责实现 JMQ2/JMQ4 元数据验证，链路监控报警及管理端页面开发工作"
    ]

  , paragraph
    [ cn "\\role{消息队列}{客户端}"
    ]
  , itemize
    [ cn $ "\\item 负责 JMQ JAVA 客户端，主要包括 bug 修复及性能调优，经历了多次618，双11大促的考验"

    , cn $ "\\item 负责拓展 JMQ 客户端生态，提供 Spring，SpringBoot 支持"

    , cn "\\item 负责设计实现 JMQ GO 版客户端，支持同步/异步发送，主动拉取和订阅消费，支持广播消息，通过 ACK 机制保证消息的有序，在容器中性能要比 JAVA 客户端高出 50\\%，并接入了 Mesh"

    , cn "\\item 日常解决用户问题，提供技术支持，提高用户体验"
    ]
  ]
  where
    joyqueue = "\\href{https://github.com/chubaostream/joyqueue} {JMQ}"

elasticsearchsql :: Resume
elasticsearchsql = paragraph
  [ github "iamazy/elasticsearch-sql" `datedSection` bold "elasticsearch-sql"
  , cn "Elasticsearch SQL 查询引擎"

  , itemize
    [ cn "\\item 使用 Antlr4 构建 DSL，支持常见 SQL 语法，以及对 GEO 数据（点，线，面）的表达"

    , cn "\\item 支持常见的 SQL（组合）查询，Join（parent-child）查询，排序，分页，过滤，聚类，并支持对 GEO 数据进行范围搜索等"

    , cn "\\item 支持索引的创建，插入，路由，删除，迁移（reindex）"

    , cn "\\item 提供一个 Elasticsearch 插件，支持在 Kibana 上进行数据查询，并进行数据可视化展示"

    , cn "\\item 集成 JDBC 接口，支持集成 Mybatis，Spring/SpringBoot 等生态"
    
    ]
  ]

jvm :: Resume
jvm = paragraph
  [ github "iamazy/jvm-rs" `datedSection` bold "jvm-rs"
  , cn "rust 实现 jvm"

  , itemize
    [ cn "\\item 使用 Rust 实现 JVM，支持 class 文件的解析，类的加载，对象的转换"
    , cn "\\item 实现了运行时数据区，可以执行大多数 JVM 指令，支持运行简单的 Java 程序"
    ]
 ]

devTools :: Resume
devTools = paragraph
  [ itemTeX "开发工具" "Development Tool"
  , cn "能适应任何编辑器/操作系统，平常在 MacOS 下使用 JetBrains IDE、VSCode，"
  , cn $ "有使用 " ++ intercalate "、" tools ++ " 等团队协作工具的经验。"
  ] where
     tools = ["GitHub", "Coding.net", "GitLab", "Gitee"]

programmingLanguages :: Resume
programmingLanguages = paragraph
  [ itemTeX "编程语言" "Program Language"
  , cn "\\textbf{泛语言}（编程不受特定语言限制），"
  , cn $ "且尤其熟悉 " ++ very ++ "，"
  , cn $ "较为熟悉 " ++ somehow ++ " (排名均不分先后)。"
  ] where
      somehow = "C C++ C\\# Python"
      very    = "Java Go Rust JavaScript"

skills :: Resume
skills = section "技能" "Skills" . pure $ itemize
  [ programmingLanguages
  , devTools
  ]

resume :: Resume
resume = paragraph
  [ pure "% !TEX program = xelatex"
  , pure "% This file is generated, don't manually edit!"

  -- head
  , paragraph
    [ pure "\\documentclass{resume}"
    , cn   "\\usepackage{lastpage}"
    , cn   "\\usepackage{fancyhdr}"
    -- disable extra space before next section
    , pure "\\usepackage{linespacing_fix}"
    , cn   "\\usepackage[fallback]{xeCJK}"
    ]

  --  \setmainfont[]{SimSun}
  --  \setCJKfallbackfamilyfont{rm}{HAN NOM B}
  --  \setCJKmainfont{Source Han Serif SC Regular}
  --  \renewcommand{\thepage}{\Chinese{page}}

  -- begin document
  , pure "\\begin{document}"
  , cn "\\renewcommand\\headrulewidth{0pt}"

  -- dare?
  , tex "name" "江楠" "Iamazy Jiang"

  , basicInfo
  , education

  , section "工作经历" "Work Experience"
    [ zky
    , jd
    ]

  , section "个人项目" "Personal Projects"
    [ noSimple $ elasticsearchsql
    , noSimple $ jvm
    ]

  , skills

  , section "其他" "Miscellaneous"
    [
      let rustmagazine = "https://github.com/RustMagazine"
          toydb = "https://github.com/erikgrinaker/toydb"
      in itemize
      [ cn "\\item 日常混迹于开源社区，是"
        , cn $ href rustmagazine ++ "{Rust 杂志}小组成员"
        , cn "\\item 对分布式存储系统，数据库有强烈的兴趣，给" 
        , cn $ href toydb ++ "{Toydb} 提交过代码，并优化过其中 Raft PreVote 相关模块"
        , cn "\\item 自驱力较强，喜欢发散思维，善于解决问题，很喜欢交朋友"
      ]
    ]

  -- end document
  , pure "\\end{document}"
  ]
