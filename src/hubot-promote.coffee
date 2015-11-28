# Description
#   Release the CEO from promoting employees
#
# Commands:
# hubot promote <username> - assigns the username to a very important title
# hubot demote <username> - demotes the username from a bullshit title

module.exports = (robot) ->
  robot.respond /promote ([^:]+):?/i, (res) ->
    name = res.match[1].trim()
    user = findUser name
    message = "I am really excited to announce that #{user.name} has been promoted to #{robot.random_bullshit_title(res)}. #{user.name} has helped to #{robot.random_bullshit_activity(res)}. Please join me in congratulating #{user.name} on the news! 🎊 🎉"

    say('promoted', message, res, user)

  robot.respond /demote ([^:]+):?/i, (res) ->
    name = res.match[1].trim()
    user = findUser name
    message = "The management has decided to demote #{user.name} from #{robot.random_bullshit_title(res)} in accordance with the company policies. This action is being taken as a result of a failure to #{robot.random_bullshit_activity(res)}."

    say('demoted', message, res, user)

  say = (action, message, res, user) ->
    if typeof user is 'object'
      if user.name == robot.name
        tooGood('demoted')
      else
        res.send message
    else if typeof user.length > 1
      res.send "I found #{user.length} people named #{name}"
    else
      res.send "I don't know anything about #{name}"


  tooGood = (action) ->
    res.send "I'm too good to be #{action}!"

  findUser = (name) ->
    users = robot.brain.usersForFuzzyName name

    if users.length is 1
      users[0]
    else if users.length > 1
      users
    else
      false

  robot.random_bullshit_activity = (res) ->
    adverbs = ['appropriately', 'assertively', 'authoritatively', 'collaboratively', 'compellingly', 'competently', 'completely', 'continually', 'conveniently', 'credibly', 'distinctively', 'dramatically', 'dynamically', 'efficiently', 'energistically', 'enthusiastically', 'fungibly', 'globally', 'holisticly', 'interactively', 'intrinsically', 'monotonectally', 'objectively', 'phosfluorescently', 'proactively', 'professionally', 'progressively', 'quickly', 'rapidiously', 'seamlessly', 'synergistically', 'uniquely']
    verbs = ['actualize', 'administrate', 'aggregate', 'architect', 'benchmark', 'brand', 'build', 'cloudify', 'communicate', 'conceptualize', 'coordinate', 'create', 'cultivate', 'customize', 'deliver', 'deploy', 'develop', 'dinintermediate disseminate', 'drive', 'embrace', 'e-enable', 'empower', 'enable', 'engage', 'engineer', 'enhance', 'envisioneer', 'evisculate', 'evolve', 'expedite', 'exploit', 'extend', 'fabricate', 'facilitate', 'fashion', 'formulate', 'foster', 'generate', 'grow', 'harness', 'impact', 'implement', 'incentivize', 'incubate', 'initiate', 'innovate', 'integrate', 'iterate', 'leverage existing', "leverage other's", 'maintain', 'matrix', 'maximize', 'mesh', 'monetize', 'morph', 'myocardinate', 'negotiate', 'network', 'optimize', 'orchestrate', 'parallel task', 'plagiarize', 'pontificate', 'predominate', 'procrastinate', 'productivate', 'productize', 'promote', 'provide access to', 'pursue', 'recaptiualize', 'reconceptualize', 'redefine', 're-engineer', 'reintermediate', 'reinvent', 'repurpose', 'restore', 'revolutionize', 'scale', 'seize', 'simplify', 'strategize', 'streamline', 'supply', 'syndicate', 'synergize', 'synthesize', 'target', 'transform', 'transition', 'underwhelm', 'unleash', 'utilize', 'visualize', 'whiteboard']
    adjectives = ['24/7', '24/365', 'accurate', 'adaptive', 'alternative', 'an expanded array of', 'B2B', 'B2C', 'backend', 'backward-compatible', 'best-of-breed', 'bleeding-edge', 'bricks-and-clicks', 'business', 'clicks-and-mortar', 'client-based', 'client-centered', 'client-centric', 'client-focused', 'collaborative', 'compelling', 'competitive', 'cooperative', 'corporate', 'cost effective', 'covalent', 'cross functional', 'cross-media', 'cross-platform', 'cross-unit', 'customer directed', 'customized', 'cutting-edge', 'distinctive', 'distributed', 'diverse', 'dynamic', 'e-business', 'economically sound', 'effective', 'efficient', 'elastic', 'emerging', 'empowered', 'enabled', 'end-to-end', 'enterprise', 'enterprise-wide', 'equity invested', 'error-free', 'ethical', 'excellent', 'exceptional', 'extensible', 'extensive', 'flexible', 'focused', 'frictionless', 'front-end', 'fully researched', 'fully tested', 'functional', 'functionalized', 'fungible', 'future-proof', 'global', 'go forward', 'goal-oriented', 'granular', 'high standards in', 'high-payoff', 'hyperscale', 'high-quality', 'highly efficient', 'holistic', 'impactful', 'inexpensive', 'innovative', 'installed base', 'integrated', 'interactive', 'interdependent', 'intermandated', 'interoperable', 'intuitive', 'just in time', 'leading-edge', 'leveraged', 'long-term high-impact', 'low-risk high-yield', 'magnetic', 'maintainable', 'market positioning', 'market-driven', 'mission-critical', 'multidisciplinary', 'multifunctional', 'multimedia based', 'next-generation', 'on-demand', 'one-to-one', 'open-source', 'optimal', 'orthogonal', 'out-of-the-box', 'pandemic', 'parallel', 'performance based', 'plug-and-play', 'premier', 'premium', 'principle-centered', 'proactive', 'process-centric', 'professional', 'progressive', 'prospective', 'quality', 'real-time', 'reliable', 'resource sucking', 'resource maximizing', 'resource-leveling', 'revolutionary', 'robust', 'scalable', 'seamless', 'stand-alone', 'standardized', 'standards compliant', 'state of the art', 'sticky', 'strategic', 'superior', 'sustainable', 'synergistic', 'tactical', 'team building', 'team driven', 'technically sound', 'timely', 'top-line', 'transparent', 'turnkey', 'ubiquitous', 'unique', 'user-centric', 'user friendly', 'value-added', 'vertical', 'viral', 'virtual', 'visionary', 'web-enabled', 'wireless', 'world-class', 'worldwide']
    nouns = ['action items', 'alignments', 'applications', 'architectures', 'bandwidth', 'benefits', 'best practices', 'catalysts for change', 'channels', 'clouds', 'collaboration and idea-sharing', 'communities', 'content', 'convergence', 'core competencies', 'customer service', 'data', 'deliverables', 'e-business', 'e-commerce', 'e-markets', 'e-tailers', 'e-services', 'experiences', 'expertise', 'functionalities', 'fungibility', 'growth strategies', 'human capital', 'ideas', 'imperatives', 'infomediaries', 'information', 'infrastructures', 'initiatives', 'innovation', 'intellectual capital', 'interfaces', 'internal or "organic" sources', 'leadership', 'leadership skills', 'manufactured products', 'markets', 'materials', 'meta-services', 'methodologies', 'methods of empowerment', 'metrics', 'mindshare', 'models', 'networks', 'niches', 'niche markets', 'nosql', 'opportunities', '"outside the box" thinking', 'outsourcing', 'paradigms', 'partnerships', 'platforms', 'portals', 'potentialities', 'rocess improvements', 'processes', 'products', 'quality vectors', 'relationships', 'resources', 'results', 'ROI', 'scenarios', 'schemas', 'services', 'solutions', 'sources', 'strategic theme areas', 'storage', 'supply chains', 'synergy', 'systems', 'technologies', 'technology', 'testing procedures', 'total linkage', 'users', 'value', 'vortals', 'web-readiness', 'web services']
    return "#{res.random(adverbs)} #{res.random(verbs)} #{res.random(adjectives)} #{res.random(nouns)}"

  robot.random_bullshit_title = (res) ->
    one = ['Executive','Vice', 'Co-', 'Chief', 'Lead', 'Senior', 'Head']
    two = ['Director', 'President', 'Chairperson', 'Director', 'Officer', 'Architect', 'Guru', 'Evangelist', 'Technician', 'Visionary', 'Stategist', 'Consultant', 'Manager', 'Minister', 'Counsel', 'Regent', 'Enthusiast', 'Marshall', 'Specialist', 'Administrator', 'Coordinator', 'Apostle', 'Missionary', 'Mentor', 'Enabler', 'Knowledgarian']
    three = ['Organic', 'Scalable', 'Robust', 'Encapsulated', 'Intelligent', 'Strategic', 'Dynamic', 'Mission-Critical', 'N-Tier', 'Creative', 'Targetted', 'Vertical', 'Collaborative', 'Dynamic', 'Enterprise', 'Real-Time', 'Proactive', 'Revolutionary', 'Synergistic', 'Viral', 'Virtual', 'Turn-Key', 'Extensible', 'Convergent', 'Enmeshed', 'B2C2B']
    four = ['E-Commerce', 'M-Commerce', 'Wireless', 'Brand', 'E-Business', 'Portal', 'Value', 'Network', 'Component', 'Media', 'Content', 'Logic', 'Experience', 'Interaction', 'B2B', 'B2C', 'P2P', 'End-to-End', 'End-User', 'Front End', 'Back End']
    five = ['Solutions', 'Processes', 'Planning', 'Conception', 'Analysis', 'Development', 'Marketing', 'Evolution', 'Operations', 'Engagement', 'Therapy', 'Propaganda', 'Deployment', 'Enhancement', 'Implementation', 'Cultivation', 'Empowerment', 'Innovation', 'Optimization', 'Applications', 'Partnerships', 'Investments', 'Paradigms', 'Infrastructures', 'Positioning', 'Intelligence']
    return "#{res.random(one)} of #{res.random(two)} #{res.random(three)} #{res.random(four)}"

