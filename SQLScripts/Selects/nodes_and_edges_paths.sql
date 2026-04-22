SELECT
    edge.value,
    edge.description,
    edge.weight,
    edge.from_node,
    from_node.value,
    to_node.value,
    from_node.image,
    to_node.image
FROM edge
JOIN node from_node ON edge.from_node = from_node.node_id
JOIN node to_node ON edge.to_node = to_node.node_id
ORDER BY edge.weight DESC;